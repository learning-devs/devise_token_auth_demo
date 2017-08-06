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

class PayPalPayment < ApplicationRecord
end
