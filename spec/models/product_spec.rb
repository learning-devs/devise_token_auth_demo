# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  price       :integer          not null
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do

	describe "#validate_product_field_required" do
		it{should validate_presence_of :name}
		it{should validate_presence_of :user_id}
		it{should validate_presence_of :price}
		it{should validate_presence_of :description}
	end

	describe "#validate_product_field_numericality" do
		it{should validate_numericality_of :price}
	end


	describe "#validate_product_filter" do
		it "should valdidate products name containt 'Gas'" do
			user = FactoryGirl.create(:user)
			FactoryGirl.create(:product, name: "Gaseosa",description: "Producto Liquido", price: 2000,user_id: user.id)
			FactoryGirl.create(:product, name: "Papitas",description: "Producto comestible", price: 2000,user_id: user.id)
			FactoryGirl.create(:product, name: "Leche",description: "Producto Lacteo", price: 2000,user_id: user.id)
			expect(Product.filter_name("Gas").count == 1).to be_truthy #(not nil or false)
		end

		it "should valdidate products description containt 'Liqu'" do
			user = FactoryGirl.create(:user)
			FactoryGirl.create(:product, name: "Gaseosa",description: "Producto Liquido", price: 2000,user_id: user.id)
			FactoryGirl.create(:product, name: "Papitas",description: "Producto comestible", price: 2000,user_id: user.id)
			FactoryGirl.create(:product, name: "Leche",description: "Producto Lacteo", price: 2000,user_id: user.id)
			expect(Product.filter_description("Liqu").count == 1).to be_truthy #(not nil or false)
		end
	end
	
end
