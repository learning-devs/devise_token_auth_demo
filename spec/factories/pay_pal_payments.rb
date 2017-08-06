# == Schema Information
#
# Table name: pay_pal_payments
#
#  id         :integer          not null, primary key
#  email      :string
#  ip         :string
#  status     :string
#  fee        :decimal(6, 2)
#  paypal_id  :string
#  total      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :pay_pal_payment do
    email "MyString"
    ip "MyString"
    status "MyString"
    fee "9.99"
    paypal_id "MyString"
    total "9.99"
  end
end
