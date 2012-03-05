require 'minitest_helper'

describe "Todos integration" do
  it "includes todo task on todo show page" do
    todo = Todo.create!({task: "Play Zork"})
    visit todo_path(todo)
    page.text.must_include "Play Zork"
  end
end
