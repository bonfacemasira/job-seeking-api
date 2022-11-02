class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :employer, null: false, foreign_key: true
      t.integer :amount
      t.string :payment_id
      t.string :mpesaReceiptNumber
      t.string :phoneNumber
      t.string :checkoutRequestID
      t.string :merchantRequestID
      t.timestamps
    end
  end
end
