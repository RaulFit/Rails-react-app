FactoryBot.define do
  factory :enrolment do
    association :user
    association :course
    progress { 0 }
  end
end