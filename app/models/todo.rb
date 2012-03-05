class Todo < ActiveRecord::Base
  scope :active, where(complete: false)
  scope :complete, where(complete: true)

  def due_today?
    due_at && due_at.today?
  end
  def overdue?
    due_at && due_at.past?
  end
end
