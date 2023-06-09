class CandidatesController < ApplicationController
  def vacancies
    positions = Position.where(vacancies: true)
    serialized_positions = positions.map do |position|
      {
        id: position.id,
        name: position.name,
        vacancies: position.vacancies,
        requirements: position_requirements(position.name),
        created_at: position.created_at,
        updated_at: position.updated_at,
      }
    end

    render json: serialized_positions, status: :ok
  end

  def index
    position_name = params[:level].capitalize
    position = Position.find_by(name: position_name)
    if position.nil?
      render json: { error: "No #{position_name} candidates are registered" }, status: :not_found
      return
    end

    candidates = Candidate.where(position_id: position.id).includes(:party, :ward)

    serialized_candidates = candidates.map do |candidate|
      {
        id: candidate.id,
        name: candidate.name,
        education: candidate.education,
        integrity: candidate.integrity,
        image: candidate.image,
        kenyan_citizen: candidate.kenyan_citizen,
        age: candidate.age,
        meets_educational_requirements: candidate.meets_educational_requirements,
        meets_integrity_requirements: candidate.meets_integrity_requirements,
        nominated_by_party: candidate.nominated_by_party,
        nominated_by_signatures: candidate.nominated_by_signatures,
        meets_support_requirements: candidate.meets_support_requirements,
        manifesto: candidate.manifesto,
        party_name: candidate.party.name,
        position_name: candidate.position.name,
        ward_name: candidate.ward.name,
        created_at: candidate.created_at,
        updated_at: candidate.updated_at,
      }
    end

    render json: serialized_candidates, status: :ok
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

    # Find party by abbreviation
    party = Party.find_by(abbreviation: params[:abbreviation])
    if party.nil?
      render json: { error: "Party not found" }, status: :unprocessable_entity
      return
    end

    # Find ward by name
    ward = Ward.find_by(name: params[:ward_name])
    if ward.nil?
      render json: { error: "Ward not found" }, status: :unprocessable_entity
      return
    end

    candidate = Candidate.new(candidate_params.merge(position_id: position.id, party_id: party.id, ward_id: ward.id))

    if candidate.save
      render json: {
        id: candidate.id,
        name: candidate.name,
        education: candidate.education,
        integrity: candidate.integrity,
        image: candidate.image,
        kenyan_citizen: candidate.kenyan_citizen,
        age: candidate.age,
        meets_educational_requirements: candidate.meets_educational_requirements,
        meets_integrity_requirements: candidate.meets_integrity_requirements,
        nominated_by_party: candidate.nominated_by_party,
        nominated_by_signatures: candidate.nominated_by_signatures,
        meets_support_requirements: candidate.meets_support_requirements,
        manifesto: candidate.manifesto,
        party_id: candidate.party.id,
        position_name: candidate.position.name,
        ward_id: candidate.ward.id,
        created_at: candidate.created_at,
        updated_at: candidate.updated_at,
      }, status: :created
    else
      render json: { error: candidate.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def position_requirements(position_name)
    case position_name
    when "President"
      [
        "Must be a Kenyan citizen",
        "Minimum age of 35",
        "Should not be bankrupt",
        "Must hold a degree",
        "No criminal record",
      ]
    when "Governor"
      [
        "Must be a Kenyan citizen",
        "Minimum age of 30",
        "Should have prior leadership experience",
        "Strong understanding of local issues",
        "Effective communication skills",
      ]
    when "Senator"
      [
        "Must be a Kenyan citizen",
        "Minimum age of 30",
        "Experience in public service or governance",
        "In-depth knowledge of legislative processes",
        "Strong advocate for constituents",
      ]
    when "Women_Representative"
      [
        "Must be a Kenyan citizen",
        "Minimum age of 25",
        "Experience in women empowerment",
        "Strong public speaking skills",
        "Commitment to gender equality",
      ]
    when "Member_of_Parliament"
      [
        "Must be a Kenyan citizen",
        "Minimum age of 21",
        "Active involvement in local community",
        "Understanding of legislative processes",
        "Ability to represent constituents effectively",
      ]
    when "Member_of_County_Assembly"
      [
        "Must be a Kenyan citizen",
        "Minimum age of 18",
        "Knowledge of local issues",
        "Commitment to public service",
        "Strong interpersonal skills",
      ]
    else
      []
    end
  end

  def candidate_params
    params.require(:candidate).permit(:name, :email, :education, :manifesto, :abbreviation, :ward_name)
  end
end
