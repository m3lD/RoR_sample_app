class SessionsController < ApplicationController
  
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            if user.activated?
                #Log the user in and redirect to the User's show page
                log_in user
                #boolean? ? do_one_thing : do_something_else
                params[:session][:remember_me] == '1' ? remember(user) : forget(user)
                redirect_back_or user   #Redirect to the requested URL if it exist
            else
                message = "Account not activated. "
                message += "Check your email for the activation link."
                #Error message
                flash[:warning] = message
                redirect_to root_url
            end
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end
    
    def destroy
        log_out if logged_in?
        redirect_to root_url
    end
end
