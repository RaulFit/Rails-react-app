class Course < ApplicationRecord
  belongs_to :user
  has_many :course_lessons, dependent: :destroy
  has_many :lessons, through: :course_lessons
  has_many :enrolments, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: { minimum: 3 }
end
