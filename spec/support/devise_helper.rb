module DeviseHelper
	def login_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user = FactoryGirl.create(:user)
			sign_in user
			request.headers.merge!(user.create_new_auth_token)
		end
	end
end