class AddBelongsFromScheduleToLabQueue < ActiveRecord::Migration[5.0]
  def change
    add_reference :lab_queues, :users, index: true
  end
end
