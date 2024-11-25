FactoryBot.define do
  factory :lesson do
    title { Faker::Educator.course_name }
    association :course
  end
end