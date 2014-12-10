class Task < ActiveRecord::Base
  validates :description, presence: true
  validates :due_date_cannot_be_in_the_past, :on => :create, confirmation: true



  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "cannot be in the past")
    end
  end



end
