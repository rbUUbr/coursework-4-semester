class CreateSelectedQueues < ActiveRecord::Migration[5.1]
  def change
    create_table :selected_queues do |t|

      t.belongs_to :lab_queue, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
