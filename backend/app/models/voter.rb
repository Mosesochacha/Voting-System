class Voter < ApplicationRecord
  belongs_to :user
  belongs_to :ward
  delegate :subcounty, to: :ward
  delegate :county, to: :subcounty

  validates :user_id, uniqueness: true

  def national
    county&.national
  end
end
