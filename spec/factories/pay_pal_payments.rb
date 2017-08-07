# == Schema Information
#
# Table name: pay_pal_payments
#
#  id             :integer          not null, primary key
#  payer_email    :string
#  recipient_name :string
#  payer_id       :string
#  state          :string
#  currency       :string
#  paypal_id      :string
#  amount         :decimal(8, 2)
#  sale_id        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :pay_pal_payment do
    payer_email "MyString"
    recipient_name "MyString"
    payer_id "MyString"
    state "MyString"
    fee "9.99"
    currency "MyString"
    paypal_id "MyString"
    amount "9.99"
    sale_id "MyString"
  end
end
