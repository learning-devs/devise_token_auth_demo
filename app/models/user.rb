class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          # :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :name, presence: true
end
