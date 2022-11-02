class RennameColumn < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :users, :encrypted_password, :password_digest
  end
end
