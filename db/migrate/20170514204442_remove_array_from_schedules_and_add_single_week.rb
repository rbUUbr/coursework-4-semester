class RemoveArrayFromSchedulesAndAddSingleWeek < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :week, :integer
    remove_column :schedules, :weeks
  end
end
