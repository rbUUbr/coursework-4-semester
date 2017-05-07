class AddWeeksDayToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :weeks_day, :string
  end
end
