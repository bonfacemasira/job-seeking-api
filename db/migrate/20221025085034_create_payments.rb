class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :employer, null: false, foreign_key: true
      t.integer :aomunt
      t.integer :employer_id
      t.string :payment_id

      t.timestamps
    end
  end
end