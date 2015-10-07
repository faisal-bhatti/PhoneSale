EreaderSync::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

    devise_for :users
    root :to => 'home#index'
    # root :to => 'users#index'
    # root :to => "devise/sessions#new"
    resources :profits, only: [:index]
    resources :users
    resources :phones do
        resources :profits
    	member do
    		get 'sold'
    		get 'return'
            put 'sold_out'
    	end
        collection do
            get 'soldOut'
        end
    end
end