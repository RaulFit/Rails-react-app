class Lesson < ApplicationRecord
  belongs_to :course
  has_many :comments, dependent: :destroy
  has_many :course_lessons, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3 }
end
