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

FactoryGirl.define do
	factory :product do
		name { Faker::Commerce.product_name }
		price {Faker::Number.number(4)}
		description { Faker::Commerce.material }
	end
end