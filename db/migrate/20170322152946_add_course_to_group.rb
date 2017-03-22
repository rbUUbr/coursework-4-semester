class AddCourseToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :course, :integer
  end
end
