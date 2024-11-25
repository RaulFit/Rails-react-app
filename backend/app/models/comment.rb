class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :body, presence: true, length: { minimum: 1 }
end
