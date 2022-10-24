class CreateJobSeekers < ActiveRecord::Migration[7.0]
  def change
    create_table :job_seekers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.integer :salary_expectation
      t.enum :certificates
      t.string :cv
      t.boolean :availability

      t.timestamps
    end
  end
end
