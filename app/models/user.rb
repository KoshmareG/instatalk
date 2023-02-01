class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :generate_nickname

  has_many :messages, dependent: :destroy

  validates :nickname, presence: true

  before_validation :generate_nickname

  private

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end

  def broadcast_to_online_users
    broadcast_remove_to('online_users') unless status
    broadcast_append_to('online_users', target: 'users-online') if status
  end
end
