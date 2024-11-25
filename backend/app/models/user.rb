class User < ApplicationRecord
  has_secure_password

  has_many :courses, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :enrolments, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 1 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 3 }
end
