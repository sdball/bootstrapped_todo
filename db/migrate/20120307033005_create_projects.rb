class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title

      t.timestamps
    end
    add_column :todos, :project_id, :integer
    add_index :todos, :project_id
  end
end
