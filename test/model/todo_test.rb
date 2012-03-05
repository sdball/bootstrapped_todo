require 'minitest_helper'

describe Todo do
  it "has a task" do
    todo = Todo.create!({task: "Test Todo"})
    todo.task.must_equal "Test Todo"
  end
end
