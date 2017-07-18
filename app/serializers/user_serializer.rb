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

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role

  # has_many :products
end
