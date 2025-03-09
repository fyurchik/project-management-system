FactoryBot.define do
  factory :task do
    title { 'Task' }
    description { 'Cool Task' }

    association :project
  end
end
