class AddUserPositionToSelectedQueue < ActiveRecord::Migration[5.1]
  def change
    add_column :selected_queues, :user_position, :integer, default: 1
  end
end
