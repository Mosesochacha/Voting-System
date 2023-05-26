require "bcrypt"

class User < ApplicationRecord
  has_secure_password
  has_one :voter
  enum role: { user: 0, admin_clerk: 1 , clerk: 3,}

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def blocked?
    blocked
  end
end
