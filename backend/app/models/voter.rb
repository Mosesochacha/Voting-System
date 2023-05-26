class Voter < ApplicationRecord
  belongs_to :ward
  delegate :subcounty, to: :ward
  delegate :county, to: :subcounty

  def national
    county&.national
  end
end
