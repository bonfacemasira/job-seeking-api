class CreateJobSeekers < ActiveRecord::Migration[7.0]
  def change
    create_table :job_seekers do |t|
      t.string :full_name
      t.integer :salary_expectation
      t.string :certficates
      t.string :cv
      t.boolean :availability
      t.integer :user_id

      t.timestamps
    end
  end
end
