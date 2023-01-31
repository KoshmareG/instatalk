class User < ApplicationRecord
  before_create :generate_nickname

  has_many :messages

  after_update_commit :broadcast_to_online_users

  private

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end

  def broadcast_to_online_users
    broadcast_remove_to('online_users') unless status
    broadcast_append_to('online_users', target: 'users-online') if status
  end
end
