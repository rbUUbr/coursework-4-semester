class ChangeDateColumnToDateFromLabQueue < ActiveRecord::Migration[5.1]
  def change
    remove_column :lab_queues, :date
    add_column :lab_queues, :date_of_lab, :date
  end
end
