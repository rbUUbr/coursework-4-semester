class AddCounterOfUsersToLabQueues < ActiveRecord::Migration[5.1]
  def change
    add_column :lab_queues, :users_count, :integer, default: 0
  end
end
