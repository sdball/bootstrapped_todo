module TodosHelper
  def task_labels(todo)
    labels = []
    if todo.complete?
      labels << '<span class="label label-success">Complete</span>'
    else
      if todo.due_today?
        labels << '<span class="label label-warning">Due Today</span>'
      elsif todo.overdue?
        labels << '<span class="label label-important">Overdue</span>'
      end
    end
    raw labels.join(' ')
  end
end
