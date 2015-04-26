class SessionsController < ApplicationController
  
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            if user.activated?
                # Loguea al usuario y redirige a la página del usuario
                log_in user
                # boolean? ? do_one_thing : do_something_else
                params[:session][:remember_me] == '1' ? remember(user) : forget(user)
                redirect_back_or user   # Redirige a la url pedida si existe
            else
                message = "Cuenta no activa. "
                message += "Revisa tu correo para activarla."
                # Mensaje de error
                flash[:warning] = message
                redirect_to root_url
            end
        else
            flash.now[:danger] = 'Email o contraseña invalidos'
            render 'new'
        end
    end
    
    def destroy
        log_out if logged_in?
        redirect_to root_url
    end
end
