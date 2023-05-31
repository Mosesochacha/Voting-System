class VotesController < ApplicationController
  # Vote for Member of County Assembly
  def get_mcas
    mcas = Position.where(name: "Member_of_County_Assembly").includes(:candidates, :votes)
    mcas_with_total_votes = calculate_total_votes(mcas)
    render json: mcas_with_total_votes
  end

  # Get presidential votes for wards, subcounties, counties, and national level
  def get_presidential_votes
    results = {}

    # Get all the wards
    wards = Ward.includes(:votes).joins(candidates: :position).where("positions.name = ?", "President")

    # Calculate total votes and percentage gained for each ward
    wards.each do |ward|
      total_votes = ward.votes.sum(:votes)
      percentage_gained = (total_votes.to_f / ward.registered_voters) * 100
      results[ward.name] = { total_votes: total_votes, percentage_gained: percentage_gained }
    end

    # Get all the subcounties
    subcounties = Subcounty.includes(wards: { candidates: :position }).joins(wards: { candidates: :position }).where("positions.name = ?", "President")

    # Calculate total votes and percentage gained for each subcounty
    subcounties.each do |subcounty|
      total_votes = subcounty.wards.sum(:votes)
      percentage_gained = (total_votes.to_f / subcounty.registered_voters) * 100
      results[subcounty.name] = { total_votes: total_votes, percentage_gained: percentage_gained }
    end

    # Get all the counties
    counties = County.includes(subcounties: { wards: { candidates: :position } }).joins(subcounties: { wards: { candidates: :position } }).where("positions.name = ?", "President")

    # Calculate total votes and percentage gained for each county
    counties.each do |county|
      total_votes = county.subcounties.sum(:votes)
      percentage_gained = (total_votes.to_f / county.registered_voters) * 100
      results[county.name] = { total_votes: total_votes, percentage_gained: percentage_gained }
    end

    # Calculate total votes and percentage gained for the national level
    total_votes_national = National.includes(counties: { subcounties: { wards: { votes: { candidate: :position } } } }).joins(counties: { subcounties: { wards: { votes: { candidate: :position } } } }).where("positions.name = ?", "President").sum(:votes)
    total_registered_voters_national = National.sum(:registered_voters)
    percentage_gained_national = (total_votes_national.to_f / total_registered_voters_national) * 100

    results["National"] = { total_votes: total_votes_national, percentage_gained: percentage_gained_national }

    render json: results
  end

  private

  def calculate_total_votes(positions)
    positions_with_total_votes = []

    positions.each do |position|
      total_votes = position.votes.sum(:votes)
      positions_with_total_votes << { position: position, total_votes: total_votes }
    end

    positions_with_total_votes
  end

  def vote_params
    params.require(:vote).permit(:voter_id, :candidate_id, :position_id, :votes, :voting_start_date, :voting_end_date)
  end
end
