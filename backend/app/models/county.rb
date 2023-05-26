class County < ApplicationRecord
  belongs_to :national
  has_many :subcounties
  has_many :wards , through: :subcounties
end
