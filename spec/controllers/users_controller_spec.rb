require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
	
	describe "Login user" do
		login_user
		it "should have a current_api_v1_user" do
			expect(subject.current_api_v1_user).to_not eq(nil)
		end
	end
end
