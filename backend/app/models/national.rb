class National < ApplicationRecord
    has_many :counties
    has_many :subcounties, through: :counties
    has_many :wards, through: :subcounties
  end
  