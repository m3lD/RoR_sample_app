module SessionsHelper
    
    # Loguea al usuario @user
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # Recuerda a un usuario en una sesion
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
    
    # Cierra sesión el usuario actual
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end
    
    # Olvida una sesion creada
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    
    # Devuelve el usuario correpondiente al token de la cookie recordada
    def current_user
        if(user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif(user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(:remember, cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end
    
    # Devuelve true si @user es el usuario actual
    def current_user?(user)
        user == current_user
    end
    
    # Devuelve true si el usuario ya se encuentra logueado o falso de lo contrario
    def logged_in?
        !current_user.nil?
    end
    
    # Redirige a la ubicacion almacenada o default
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end
    
    # Almacena la url a la que se intenta acceder
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end
end
