class Room < ApplicationRecord
  has_many :messages

  before_create

  def to_param
    token
  end

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex(2)
  end
end
