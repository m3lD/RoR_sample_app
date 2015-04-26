class MicropostsController < ApplicationController
    
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
    
    # Crea un nuevo micropost
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end
    
    # Elimina un micropost y redirige a url anterior o a root si es nula
    def destroy
        @micropost.destroy
        flash[:success] = "Micropost deleted"
        redirect_to request.referrer || root_url
    end
    
    private
        
        def micropost_params
            params.require(:micropost).permit(:content, :picture)
        end
    
        # Corrobora que el usuario actual tenga un micropost con el id actual 
        def correct_user
            @micropost = current_user.microposts.find_by(id: params[:id])
            redirect_to root_url if @micropost.nil?
        end
end
