# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "MyString"
    due_at "2013-12-13 18:24:16"
    priority 1
    completed false
  end
end
