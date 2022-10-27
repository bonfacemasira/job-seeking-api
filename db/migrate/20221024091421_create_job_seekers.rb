class CreateJobSeekers < ActiveRecord::Migration[7.0]
  def change
    create_table :job_seekers do |t|
      t.string :full_name
      t.integer :salary_expectation
      t.string :certificates, array:true, default:[]
      t.string :cv
      t.boolean :availability
      t.integer :user_id
       t.string :passport
       t.string :country
       t.string :image
       t.string :experience, array:true, default:[]
       t.string :job_type
      t.timestamps
    end
  end
end
