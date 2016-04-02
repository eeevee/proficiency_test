# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    name "Pedro"
    register_number "252525"
    status {Student.statuses.keys.sample}
  end
end
