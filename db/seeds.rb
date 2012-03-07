require 'date'
t1 = Todo.create({task: 'Twitter Bootstrap Rails Todo App', description: 'Write a Rails application using Twitter Bootstrap to track todo items.', due_at: Date.today})
t2 = Todo.create({task: 'Create db seeds', description: 'Write db seeds to populate todo items.', complete: true})
p = Project.create({title: 'Default'})
p.todos << t1
p.todos << t2
