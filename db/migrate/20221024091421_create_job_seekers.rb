class CreateJobSeekers < ActiveRecord::Migration[7.0]
  def change
    create_table :job_seekers do |t|
      t.string :full_name
      t.integer :salary_expectation
      # t.attachment :certificate
      # t.attachment :cv
      t.boolean :availability
      # t.integer :user_id
      #  t.attachment :passport
       t.string :country
      #  t.attachment :image 
       t.text :experience
      
       t.string :job_type
      t.timestamps
    end
  end
end
