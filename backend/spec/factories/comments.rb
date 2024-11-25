FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence }
    association :user
    association :lesson
  end
end