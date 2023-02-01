class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :generate_nickname

  has_many :messages, dependent: :destroy

  validates :nickname, presence: true

  before_validation :generate_nickname

  private

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase if self.nickname.blank?
  end
end
