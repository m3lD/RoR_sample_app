Rails.application.routes.draw do
    
    root               'static_pages#home'
    get 'help'      => 'static_pages#help'
    get 'about'     => 'static_pages#about'
    get 'contact'   => 'static_pages#contact'
    get 'signup'    => 'users#new'
    get 'login'     => 'sessions#new'                   # Page for a new session
    post 'login'    => 'sessions#create'                # Create a new session
    delete 'logout' => 'sessions#destroy'               # Delete a session
    resources :users
    resources :account_activations, only: [:edit]
    
end
