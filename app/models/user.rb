class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, message: "Password is too short (minimum is 6 characters)!" }

  has_many :movies
end
