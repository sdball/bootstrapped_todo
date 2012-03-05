require 'minitest_helper'

describe "Todos integration" do
  it "includes todo name on todo show page" do
    todo = Todo.create!({name: "Play Zork"})
    visit todo_path(todo)
    page.text.must_include "Play Zork"
  end
end
