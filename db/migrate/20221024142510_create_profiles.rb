class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :employer_id
      t.integer :job_seeker_id
      t.string :full_name
      t.string :email
      t.integer :phone_number
      t.integer :user_id
      t.string :bio
      t.string :profile_picture
      t.timestamps
    end
  end
end
