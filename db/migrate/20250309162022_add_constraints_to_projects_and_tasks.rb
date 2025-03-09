class AddConstraintsToProjectsAndTasks < ActiveRecord::Migration[8.0]
  def change
    change_column_null :projects, :name, false
    change_column_null :tasks, :title, false
    change_column_default :tasks, :status, 0
  end
end
