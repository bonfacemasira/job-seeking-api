class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.boolean :status
      t.integer :user_id
      t.string :null
      t.string :false
      t.string :default
      t.string :Pending

      t.timestamps
    end
  end
end
