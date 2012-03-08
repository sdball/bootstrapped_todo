require 'minitest_helper'

describe "Projects integration" do
  it "includes project todos on show page" do
    project = Project.create!({title: 'Integration Project'})
    t1 = Todo.create!({task: "Play Zork"})
    t2 = Todo.create!({task: "Play Enchanter"})
    project.todos << t1
    project.todos << t2
    visit project_todos_path(project)
    page.text.must_include t1.task
    page.text.must_include t2.task
  end
end

describe "Projects sidebar integration" do
  it "shows projects in the sidebar" do
    project = Project.create!({title: 'Sidebar Project'})
    visit todos_path
    page.text.must_include project.title
  end
end
