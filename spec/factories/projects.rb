FactoryBot.define do
  factory :project do
    name { 'Proj' }
    description { 'Cool Proj' }

    association :user
  end
end
