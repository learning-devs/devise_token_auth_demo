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
		transient  do
			user_id 1
		end
	
		create_user_admin do
			User.find_by(name: "Administrador") || 
			FactoryGirl.create(:user,:create_user_admin)
		end
	end
end