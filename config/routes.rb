Rails.application.routes.draw do
  resources :products
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do
      get 'users', to: 'users#index'
      resources :products
    end
  end

end
