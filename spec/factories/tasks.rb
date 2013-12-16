# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    user
    title "Some Important Task"
    due_at Date.tomorrow
    priority "high"
  end
end
