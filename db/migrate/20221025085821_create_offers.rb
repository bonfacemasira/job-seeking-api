class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :employer, null: false, foreign_key: true
      t.references :job_seeker, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :image
      t.string :name
      t.string :job_title
     

      t.timestamps
    end
  end
end
