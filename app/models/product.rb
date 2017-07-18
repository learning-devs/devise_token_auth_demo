class Product < ApplicationRecord
  belongs_to :user

  validates :name, :description, :price, :user_id, presence: true
  validates :price, numericality: true

end
