class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :name, presence: true
end
