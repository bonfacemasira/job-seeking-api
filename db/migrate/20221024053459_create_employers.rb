class CreateEmployers < ActiveRecord::Migration[7.0]
  def change
    create_table :employers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.string :email
      t.integer :phone_number
      t.string :organization

      t.timestamps
    end
  end
end
