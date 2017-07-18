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

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :user

  # belongs_to :user

  def user
    object.user.name
  end

end
