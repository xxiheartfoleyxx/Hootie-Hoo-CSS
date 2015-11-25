Rails.application.routes.draw do

  devise_for :users, :path_prefix => 'd', :controllers => {:registrations => "users"}

  resources :profiles
  authenticated :user do
    devise_scope :user do
      root 'users#index'
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


end
