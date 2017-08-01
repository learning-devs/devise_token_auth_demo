require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'factory_girl'

RspecApiDocumentation.configure do |config|
	config.format = [:json, :combined_text, :html]
	config.curl_host = 'http://localhost:3000'
end

resource "Products user admin" do

	header "Content-Type", "application/json"
	before (:each) do
		# create fake user
		@user = FactoryGirl.build(:user)
		set_header(@user.create_new_auth_token)
	end

	# GET /api/v1/products
	get "/api/v1/products" do
		parameter :page, "current page product list", required: true
		parameter :size, "quantity recods per page", required: true

		it "Show list products" do
			explanation "Get list product page 1"
			do_request(page: '1',size: '5')
			expect(status).to eq(200)
		end
	end

	# POST /api/v1/products
	post "/api/v1/products" do
		let(:raw_post) { params.to_json }
		
		parameter :name, "Product name", required: true, scope: :product
		parameter :price, "Product price", required: true, scope: :product
		parameter :description, "Procut description", required: true, scope: :product
		parameter :user_id, "Id user that create product", required: true, scope: :product

		it "create a product" do
			explanation "User with admin role can create a new product"
			product = FactoryGirl.build(:product)
			do_request(name: product.name, price: product.price, description: product.description, user_id: @user.id)
			expect(status).to eq(201)
		end
	end
end

resource "Products user employee" do
	header "Content-Type", "application/json"

	before (:each) do
		# create fake user
		@user = FactoryGirl.build(:user,role: "employee")
		set_header(@user.create_new_auth_token)
	end

	# GET /api/v1/products
	get "/api/v1/products" do
		parameter :page, "current page product list", required: true
		parameter :size, "quantity recods per page", required: true

		it "Show list products" do
			explanation "Get list product page 1"
			do_request(page: '1',size: '5')
			expect(status).to eq(200)
		end
	end

	# POST /api/v1/products
	post "/api/v1/products" do
		let(:raw_post) { params.to_json }

		parameter :name, "Product name", required: true, scope: :product
		parameter :price, "Product price", required: true, scope: :product
		parameter :description, "Procut description", required: true, scope: :product
		parameter :user_id, "Id user that create product", required: true, scope: :product

		it "Create a product" do
			explanation "User with employee role can not create a new product"
			product = FactoryGirl.build(:product)
			do_request(name: product.name, price: product.price, description: product.description, user_id: @user.id)
			expect(status).to eq(422)
		end
	end
end


resource "Products user not login" do
	# GET /api/v1/products
	get "/api/v1/products" do
		parameter :page, "current page product list", required: true
		parameter :size, "quantity recods per page", required: true

		it "Show list products" do
			explanation "Get list product page 1"
			do_request(page: '1',size: '5')
			expect(status).to eq(401)
		end
	end
end

# Before each call, set key value to header. Required by auth
def set_header(auth_headers)
	header 'access-token', auth_headers['access-token']
	header 'token-type', auth_headers['token-type']
	header 'client', auth_headers['client']
	header 'expiry', auth_headers['expiry']
	header 'uid', auth_headers['uid']
end