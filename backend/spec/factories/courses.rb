FactoryBot.define do
  factory :course do
    title { Faker::Educator.course_name }
    association :user
    difficulty { 'Easy' }
    public { true }
  end
end