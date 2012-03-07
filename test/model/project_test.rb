require 'minitest_helper'

describe Project do
  it "contains todos" do
    p = Project.create!({title: "Test Project"})
    t = Todo.create!({task: "Task for Test Project"})
    p.todos << t
    p.todos.length.must_equal 1
    p.todos.first.task.must_equal t.task
  end
end
