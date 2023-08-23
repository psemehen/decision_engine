class CreateLoanApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :loan_applications do |t|
      t.string :personal_code
      t.integer :loan_amount
      t.integer :loan_period
      t.integer :approved_amount

      t.timestamps
    end
  end
end
