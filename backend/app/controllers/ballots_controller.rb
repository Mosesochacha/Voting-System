class BallotsController < ApplicationController
  # Get the current user's voter and the Governor in the same county
  def get_governor
    begin
      current_user_voter = current_user.voter
      current_county_name = current_user_voter.county.name
    rescue
      render json: { error: "Voter not found for the current user" }, status: :unprocessable_entity
      return
    end

    governor = Position.joins(candidates: { ward: { subcounty: :county } })
                       .where("positions.position_name = ?", "Governor")
                       .where("counties.name = ?", current_county_name)
                       .includes(:candidates, :votes)

    governor_with_total_votes = calculate_total_votes(governor)

    render json: {
             governor: governor_with_total_votes,
           }
  end

  def get_president
    begin
      current_user_voter = current_user.voter
      current_national = current_user_voter.national
    rescue
      render json: { error: "Voter not found for the current user" }, status: :unprocessable_entity
      return
    end

    president = Position.joins(candidates: { ward: { subcounty: { county: :national } } })
                        .where("positions.position_name = ?", "President")
                        .where("nationals.name = ?", current_national)
                        .includes(:candidates, :votes)

    president_with_total_votes = calculate_total_votes(president)
    render json: president_with_total_votes
  end

  def get_senator
    begin
      current_user_voter = current_user.voter
      current_county_name = current_user_voter.county.name
    rescue
      render json: { error: "Voter not found for the current user" }, status: :unprocessable_entity
      return
    end

    senator = Position.joins(candidates: { ward: { subcounty: :county } })
                      .where("positions.position_name = ?", "Senator")
                      .where("counties.name = ?", current_county_name)
                      .includes(:candidates, :votes)

    senator_with_total_votes = calculate_total_votes(senator)

    render json: {
             senator: senator_with_total_votes,
           }
  end

  def get_women_rep
    begin
      current_user_voter = current_user.voter
      current_county_name = current_user_voter.county.name
    rescue
      render json: { error: "Voter not found for the current user" }, status: :unprocessable_entity
      return
    end

    women_rep = Position.joins(candidates: { ward: { subcounty: :county } })
      .where("positions.position_name = ?", "Women_Representative")
      .where("counties.name = ?", current_county_name)
      .includes(:candidates, :votes)

    women_rep_with_total_votes = calculate_total_votes(women_rep)

    render json: {
             women_rep: women_rep_with_total_votes,
           }
  end

  # Get Member of Parliament in the same subcounty as the current user's voter
  def get_member_of_parliament
    begin
      current_user_voter = current_user.voter
      current_subcounty_id = current_user_voter.subcounty_id
    rescue
      render json: { error: "Voter not found for the current user" }, status: :unprocessable_entity
      return
    end

    mp = Position.joins(candidates: :ward)
                 .where("positions.position_name = ?", "Member_of_Parliament")
                 .where("wards.subcounty_id = ?", current_subcounty_id)
                 .includes(:candidates, :votes)

    mp_with_total_votes = calculate_total_votes(mp)
    render json: mp_with_total_votes
  end

  def get_member_of_county_assembly
    begin
      current_user_voter = current_user.voter
      current_ward_id = current_user_voter.ward_id
    rescue
      render json: { error: "Voter not found for the current user" }, status: :unprocessable_entity
      return
    end

    mca = Position.joins(candidates: :ward)
                  .where("positions.position_name = ?", "Member_of_County_Assembly")
                  .where("wards.id = ?", current_ward_id)
                  .includes(:candidates, :votes)

    mca_with_total_votes = calculate_total_votes(mca)
    render json: mca_with_total_votes
  end

  private

  def calculate_total_votes(positions)
    positions.map do |position|
      {
        id: position.id,
        name: position.name,
        candidates: position.candidates.map do |candidate|
          {
            id: candidate.id,
            name: candidate.name,
            party: candidate.party,
            votes: candidate.votes.count,
          }
        end,
      }
    end
  end
end
