class Task < ActiveRecord::Base
  validates_presence_of :title, :priority, :hours_effort, :due_date, :user_id
  validates :priority, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5, only_integer: true}
  validates :hours_effort, numericality: {greater_than: 0}

  before_save :calculate_urgency

  belongs_to :user

  def days_until_due
    Date.today - due_date + 1
  end

  def calculate_urgency
    self.urgency = priority * ((hours_effort**0.7)/days_until_due)
  end
end
