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

  it "identifies complete todos" do
    todo = Todo.create!({task: "Test1", complete: true})
    Todo.complete.length.wont_equal 0
    Todo.complete.must_include todo
    Todo.complete.first.complete.must_equal true
  end

  it "identifies active todos" do
    todo = Todo.create!({task: "Test1"})
    Todo.active.length.wont_equal 0
    Todo.active.must_include todo
    Todo.active.first.complete.wont_equal true
  end
end
