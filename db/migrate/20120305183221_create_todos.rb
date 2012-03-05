class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.boolean :complete
      t.datetime :due_at

      t.timestamps
    end
  end
end
