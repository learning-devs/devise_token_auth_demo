class CreatePayPalPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :pay_pal_payments do |t|
      t.string :payer_email
      t.string :recipient_name
      t.string :payer_id
      t.string :state
      t.decimal :fee, precision: 7, scale:2
      t.string :currency
      t.string :paypal_id
      t.decimal :amount, precision: 8, scale:2
      t.string :sale_id

      t.timestamps
    end
  end
end
