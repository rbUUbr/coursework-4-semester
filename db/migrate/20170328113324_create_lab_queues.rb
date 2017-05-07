class CreateLabQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :lab_queues do |t|
      t.string :date

      t.timestamps
    end
  end
end
