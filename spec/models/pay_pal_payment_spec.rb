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

require 'rails_helper'

RSpec.describe PayPalPayment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
