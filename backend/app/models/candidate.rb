class Candidate < ApplicationRecord
  belongs_to :party
  belongs_to :position
  belongs_to :ward 
end
