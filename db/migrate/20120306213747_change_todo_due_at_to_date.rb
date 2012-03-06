class ChangeTodoDueAtToDate < ActiveRecord::Migration
  def up
    change_column :todos, :due_at, :date
  end

  def down
    change_column :todos, :due_at, :datetime
  end
end
