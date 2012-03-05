class ChangeTodoNameToTask < ActiveRecord::Migration
  def up
    rename_column :todos, :name, :task
  end

  def down
    rename_column :todos, :task, :name
  end
end
