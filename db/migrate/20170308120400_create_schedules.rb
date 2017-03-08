class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.belongs_to :group, index: true
      t.string :subject
      t.integer :weeks, array: true
      t.integer :subgroup
      t.string :time

      t.timestamps
    end
  end
end
