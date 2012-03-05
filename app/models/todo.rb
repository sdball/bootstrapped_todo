class Todo < ActiveRecord::Base
  def due_today?
    due_at && due_at.today?
  end
  def overdue?
    due_at && due_at.past?
  end
end
