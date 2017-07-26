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

FactoryGirl.define do
	factory :user do
		name "Administrador"
		email "admin@hotmail.com"
		password "123456789"
		password_confirmation "123456789"
		role "admin"
	end
end