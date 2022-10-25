class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :employer, null: false, foreign_key: true
      t.references :job_seeker, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :profile_picture
      t.integer :employer_id
      t.integer :job_seeker_id
      t.string :full_name
      t.string :email
      t.integer :user_id
      t.string :phone_number
      t.text :bio

      t.timestamps
    end
  end
end
