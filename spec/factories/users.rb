FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "passwrod" }
  end
end
