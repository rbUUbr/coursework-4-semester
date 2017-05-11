class AddReferenceFromLabQueuesToGroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :lab_queues, :group, index: true
  end
end
