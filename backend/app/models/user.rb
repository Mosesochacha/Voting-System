require "bcrypt"

class User < ApplicationRecord
  has_secure_password

  enum role: { user: 0, admin_clerk: 1 }

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def blocked?
    blocked
  end
end
