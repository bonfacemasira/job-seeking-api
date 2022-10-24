class CreateEmployers < ActiveRecord::Migration[7.0]
  def change
    create_table :employers do |t|
      t.string :full_name
      t.string :organization
      t.string :user_id

      t.timestamps
    end
  end
end
