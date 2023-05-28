class CandidatesController < ApplicationController

  def index
    position_name = params[:level].capitalize
    position = Position.find_by(name: position_name)

    if position.nil?
      render json: { error: "No #{position_name} candidates are registered" }, status: :not_found
      return
    end

    candidates = Candidate.where(position_id: position.id)

    render json: candidates, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Position not found" }, status: :not_found
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def update
    candidate = Candidate.find_by(email: params[:email])

    if candidate.nil?
      render json: { error: "Candidate not found" }, status: :not_found
      return
    end

    if candidate.update(candidate_params)
      render json: candidate, status: :ok
    else
      render json: { error: candidate.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def destroy
    candidate = Candidate.find_by(email: params[:email])

    if candidate.nil?
      render json: { error: "Candidate not found" }, status: :not_found
      return
    end

    if candidate.destroy
      render json: { message: "Candidate has been deleted" }, status: :ok
    else
      render json: { error: candidate.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def create
    position_name = params[:level].capitalize
    position = Position.find_by(name: position_name)

    if position.nil?
      render json: { error: "No #{position_name} is registered" }, status: :not_found
      return
    end

    candidate = Candidate.new(candidate_params.merge(position_id: position.id))

    case params[:level]
    when "President"
      candidate.requirement1 = "Must be a Kenyan citizen"
      candidate.requirement2 = "Minimum age of 35"
      candidate.requirement3 = "Should not be bankrupt"
      candidate.requirement4 = "Must hold a degree"
      candidate.requirement5 = "No criminal record"
    when "Governor"
      candidate.requirement1 = "Must be a Kenyan citizen"
      candidate.requirement2 = "Minimum age of 30"
      candidate.requirement3 = "Should have prior leadership experience"
      candidate.requirement4 = "Strong understanding of local issues"
      candidate.requirement5 = "Effective communication skills"
    when "Senator"
      candidate.requirement1 = "Must be a Kenyan citizen"
      candidate.requirement2 = "Minimum age of 30"
      candidate.requirement3 = "Experience in public service or governance"
      candidate.requirement4 = "In-depth knowledge of legislative processes"
      candidate.requirement5 = "Strong advocate for constituents"
    when "Women_Representative"
      candidate.requirement1 = "Must be a Kenyan citizen"
      candidate.requirement2 = "Minimum age of 25"
      candidate.requirement3 = "Experience in women empowerment"
      candidate.requirement4 = "Strong public speaking skills"
      candidate.requirement5 = "Commitment to gender equality"
    when "Member_of_Parliament"
      candidate.requirement1 = "Must be a Kenyan citizen"
      candidate.requirement2 = "Minimum age of 21"
      candidate.requirement3 = "Active involvement in local community"
      candidate.requirement4 = "Understanding of legislative processes"
      candidate.requirement5 = "Ability to represent constituents effectively"
    when "Member_of_County_Assembly"
      candidate.requirement1 = "Must be a Kenyan citizen"
      candidate.requirement2 = "Minimum age of 18"
      candidate.requirement3 = "Knowledge of local issues"
      candidate.requirement4 = "Commitment to public service"
      candidate.requirement5 = "Strong interpersonal skills"
    else
      # Custom candidate type, add your own requirements here
    end

    if candidate.save
      render json: candidate, status: :created
    else
      render json: { error: candidate.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def candidate_params
    case params[:level]
    when "President"
      params.require(:candidate).permit(:name, :email, :education, :manifesto, :party_name, :ward_name)
    when "Governor", "Senator", "Women_Representative"
      params.require(:candidate).permit(:name, :email, :education, :manifesto, :party_name, :county_name)
    when "Member_of_Parliament", "Member_of_County_Assembly"
      params.require(:candidate).permit(:name, :email, :education, :manifesto, :party_name, :ward_name)
    else
      params.require(:candidate).permit(:name, :email, :education, :manifesto, :party_name, :position_name, :ward_name, :county_name)
    end
  end
end
