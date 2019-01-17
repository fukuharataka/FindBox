class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: {in: 2..15}
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, length: {maximum: 50}
  validates :nickname, presence: true, length: {in: 2..15}
  validates :password_digest, presence: true
end
