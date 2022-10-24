class CreateJobSeekers < ActiveRecord::Migration[7.0]
  def change
    create_table :job_seekers do |t|
      t.string :full_name
      t.string :salary_expectation
      t.string :certficates
      t.string :cv
      t.boolean :availability
      t.string :user_id

      t.timestamps
    end
  end
end
