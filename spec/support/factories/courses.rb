# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name "matemática"
    description "descrição"
    status {Course.statuses.keys.sample}
  end
end
