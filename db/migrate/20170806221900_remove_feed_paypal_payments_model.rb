class RemoveFeedPaypalPaymentsModel < ActiveRecord::Migration[5.0]
  def change
    remove_column :pay_pal_payments, :fee
  end
end
