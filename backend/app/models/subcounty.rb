class Subcounty < ApplicationRecord
  belongs_to :county
  has_many :wards
end
