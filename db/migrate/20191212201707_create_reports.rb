class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.timestamps null: false
    end
  end
end
