class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :body, presence: true, length: { maximum: 512 }
end
