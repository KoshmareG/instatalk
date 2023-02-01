class Message < ApplicationRecord
  belongs_to :user, optional:true
  belongs_to :room

  validates :user, presence: true, unless: -> { technical }
  validates :body, presence: true, length: { maximum: 512 }
end
