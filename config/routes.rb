Rails.application.routes.draw do
	
	

	namespace :api do
		namespace :v1 do
			get 'users', to: 'users#index'
			resources :products do
				collection do
					get 'search'
				end
			end

			resources :payments  do
				collection do
					post 'paypal'
				end
			end
			mount_devise_token_auth_for 'User', at: 'auth'

			mount ActionCable.server => '/cable'

		end
	end

end
