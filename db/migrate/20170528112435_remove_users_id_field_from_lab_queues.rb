class RemoveUsersIdFieldFromLabQueues < ActiveRecord::Migration[5.1]
  def change
    remove_column :lab_queues, :users_id, :integer
  end
end
