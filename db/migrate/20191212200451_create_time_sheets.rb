class CreateTimeSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :time_sheets do |t|
      t.date :date
      t.decimal :hours_worked
      t.references :employee, index: true, foreign_key: true
      t.references :report, index: true, foreign_key: true
      t.string :job_group
      t.decimal :total_pay

      t.timestamps null: false
    end
  end
end
