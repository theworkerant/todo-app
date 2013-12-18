class Task < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, on: :create, message: "can't be blank"
  validates_presence_of :title, message: "can't be blank"
  validates_presence_of :priority, message: "can't be blank"
  validates :priority, inclusion: { in: %w( high medium low) }
  validates :due_at, date: {:message => "Must be a valid date"}
  validates :completed_at, date: {:message => "Must be a valid date"}, if: :complete?
  
  def complete?
    completed_at.present?
  end
end
