class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :products

  validates :password_confirmation, presence: true, on: :create
  validates :name, presence: true
end
