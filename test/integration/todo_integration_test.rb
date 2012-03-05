require 'minitest_helper'
require 'date'

describe "Todos integration" do
  it "includes todo task on todo show page" do
    todo = Todo.create!({task: "Play Zork"})
    visit todo_path(todo)
    page.text.must_include "Play Zork"
  end

  it "labels tasks that are due today" do
    todo = Todo.create({task: "Do something today", due_at: DateTime.now})
    visit todo_path(todo)
    page.text.must_include "Due Today"
  end

  it "labels tasks that are complete" do
    todo = Todo.create({task: "It's done", complete: true})
    visit todo_path(todo)
    page.text.must_include "Complete"
  end

  it "labels tasks that are overdue" do
    todo = Todo.create({task: "Test Task", due_at: 3.days.ago})
    visit todo_path(todo)
    page.text.must_include "Overdue"
  end
end
