# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email,
      t.string :username,   
      t.integer :role, default:0
      t.string :password_digest,

      t.timestamps null: false
    end

    # add_index :users, :email,                unique: true
    # add_index :users, :username,                unique: true
    # add_index :users, :role,                unique: false
  end
end
