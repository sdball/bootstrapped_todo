require 'minitest_helper'

describe Todo do
  it "has a task" do
    todo = Todo.create!({task: "Test Todo"})
    todo.task.must_equal "Test Todo"
  end

  it "identifies tasks due today" do
    todo = Todo.create!({task: "Test", due_at: DateTime.now})
    todo.due_today?.must_equal true
  end

  it "identifies overdue tasks" do
    todo = Todo.create!({task: "Test", due_at: 1.day.ago})
    todo.overdue?.must_equal true
  end
end
