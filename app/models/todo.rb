class Todo < ActiveRecord::Base
  scope :active, where(complete: false).order('due_at DESC')
  scope :complete, where(complete: true).order('due_at DESC')

  def due_today?
    due_at && due_at.today?
  end

  def overdue?
    due_at && due_at.past?
  end
end
