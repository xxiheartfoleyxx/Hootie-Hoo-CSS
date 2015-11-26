Rails.application.routes.draw do
  resources :locations

  devise_for :users, :path_prefix => 'd', :controllers => {:registrations => "users", :omniauth_callbacks => "omniauth_callbacks"}

  resources :profiles
  authenticated :user do
    devise_scope :user do
      # root 'users#index'
      root 'locations#index'
    end
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  resources :conversations do
    resources :messages
  end
  # match 'auth/:provider/callback', to: 'sessions#create', as: 'signin', via: :get

end
