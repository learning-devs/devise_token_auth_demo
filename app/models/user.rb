# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  nickname               :string
#  image                  :string
#  email                  :string
#  tokens                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string
#

class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
					:recoverable, :rememberable, :trackable, :validatable

	include DeviseTokenAuth::Concerns::User

	has_many :products

	validates :password_confirmation, presence: true, on: :create
	validates :name, presence: true

	def self.admin?
		return self.role.eql? "admin"
	end

end
