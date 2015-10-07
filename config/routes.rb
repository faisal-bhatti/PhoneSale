EreaderSync::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

    devise_for :users
    root :to => 'home#index'
    # root :to => 'users#index'
    # root :to => "devise/sessions#new"
    resources :users
    resources :phones do
    	member do
    		get 'sold'
    		get 'return'
    	end
        collection do
            get 'soldOut'
        end
    end
end