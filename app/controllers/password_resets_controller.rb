class PasswordResetsController < ApplicationController
    
    before_action :get_user, only: [:edit, :update]
    before_action :valid_user, only: [:edit, :update]
    before_action :check_expiration, only: [:edit, :update]
    
    def new
    end

    def edit
    end
    
    # Actualiza la contraseña
    def update
        if password_blank?
            flash.now[:danger] = "La contraseña no puede estar vacia"
            render 'edit'
        elsif @user.update_attributes(user_params)
            log_in @user
            flash[:success] = "La contraseña se ha actualizado"
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    # Proceso de actualizacion de contraseña, envia correo con link de reset
    def create
        @user = User.find_by(email: params[:password_reset][:email].downcase)
        if @user
            @user.create_reset_digest
            @user.send_password_reset_email
            flash[:info] = "Te hemos enviado un email con los pasos para resetear la contraseña."
            redirect_to root_url
        else
            flash.now[:danger] = "Correo electronico no registrado."
            render 'new'
        end
    end
    
    private
        
        def user_params
            params.require(:user).permit(:password, :password_confirmation)
        end
    
        # Devuelve "true" si la contraseña esta en blanco
        def password_blank?
            params[:user][:password].blank?
        end
        
        # Busca el usuario con el email establecido
        def get_user
            @user = User.find_by(email: params[:email])
        end
    
        # Confirma un usuario valido
        def valid_user
            unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
                redirect_to root_url
            end
        end
    
        # Corrobora el tiempo de expiración de un correo de reseteo de contraseña
        def check_expiration
            if @user.password_reset_expired?
                flash[:danger] = "Password reset has expired."
                redirect_to new_password_reset_url
            end
        end                
end
