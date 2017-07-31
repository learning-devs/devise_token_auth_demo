require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
	describe "GET #Index" do
		it "should be response with unauthorized" do
			get :index, params: {page: "1"}
			expect(response).to have_http_status(:unauthorized)
		end
	end
end
