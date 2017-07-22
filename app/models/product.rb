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

class Product < ApplicationRecord
  belongs_to :user
  paginates_per 20

  validates :name, :description, :price, :user_id, presence: true
  validates :price, numericality: true

end
