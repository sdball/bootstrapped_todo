class Todo < ActiveRecord::Base
  def due_today?
    due_at && due_at.today?
  end
end
