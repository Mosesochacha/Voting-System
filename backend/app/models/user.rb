require "bcrypt"

class User < ApplicationRecord
  include BCrypt

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def blocked?
    blocked
  end
end
