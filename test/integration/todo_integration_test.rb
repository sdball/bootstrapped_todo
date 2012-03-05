require 'minitest_helper'

describe "Todos integration" do
  it "shows todo's name on its page" do
    todo = Todo.create!({name: "Play Zork"})
    visit todo_path(todo)
    page.text.must_include "Play Zork"
  end
end
