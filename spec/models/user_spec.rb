# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  name                   :string
#  nickname               :string
#  image                  :string
#  email                  :string
#  tokens                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string
#  allow_password_change  :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe User, type: :model do
	it{should validate_presence_of :email}
	it{should validate_presence_of :name}

	describe "#validate_user_register" do
		it "should not registration whitout email" do
			user = User.create(password:"1234",password_confirmation:"1234",name:"miguel")
			expect(user.valid?).to be_falsy #=>false/nil
		end
	end

end
