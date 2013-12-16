class Task < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, on: :create, message: "can't be blank"
  validates_presence_of :title, message: "can't be blank"
  validates_presence_of :priority, message: "can't be blank"
  validates :priority, inclusion: { in: %w( high medium low) }
end
