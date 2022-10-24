class AddPhonuNumberToEmployers < ActiveRecord::Migration[7.0]
  def change
    add_column :employers, :phone_number, :integer
  end
end
