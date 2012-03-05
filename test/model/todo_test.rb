require 'minitest_helper'

describe Todo do
  it "has a name" do
    todo = Todo.create!({name: "Test Todo"})
    todo.name.must_equal "Test Todo"
  end
end
