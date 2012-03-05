class DefaultCompleteToFalse < ActiveRecord::Migration
  def up
    change_column :todos, :complete, :boolean, :default => false
  end

  def down
    change_column :todos, :complete, :boolean
  end
end
