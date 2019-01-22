class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {in: 2..15}
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, length: {maximum: 50}
  validates :nickname, presence: true, length: {in: 2..15}
end
