class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :employer, null: false, foreign_key: true
      t.references :job_seeker, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
   
      t.string :email
      t.string :phone_number
      t.text :bio

      t.timestamps
    end
  end
end
