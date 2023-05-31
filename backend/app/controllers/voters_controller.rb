class VotersController < ApplicationController
  before_action :set_voter, only: [:show, :update, :destroy]
  before_action :authenticate_request
  rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from ActiveRecord::RecordNotUnique, with: :handle_record_not_unique

  # POST /voters/register
  def register_voter
    ward = Ward.find_by(id: params[:ward_id])

    if ward.nil?
      render json: { error: "Invalid ward" }, status: :unprocessable_entity
      return
    end

    @voter = Voter.new(voter_params)
    @voter.user = current_user
    @voter.county = ward.subcounty.county.name
    @voter.subcounty = ward.subcounty.name
    @voter.national = ward.subcounty.county.national.name

    if @voter.save
      render json: @voter, status: :created
    else
      render json: { error: @voter.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /voters
  def index
    @voters = Voter.all
    render json: @voters
  end

  # GET /voters/1
  def show
    if @voter.nil?
      render json: { error: "Voter not found" }, status: :not_found
    else
      render json: @voter.as_json(include: { ward: { include: { subcounty: { include: :county } } } })
    end
  end

  # PATCH/PUT /voters/1
  def update
    if @voter.update(voter_params)
      render json: @voter
    else
      render json: { error: "Failed to update voter", errors: @voter.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /voters/1
  def destroy
    if @voter.destroy
      render json: { message: "Voter deleted successfully" }
    else
      render json: { error: "Failed to delete voter" }, status: :unprocessable_entity
    end
  end

  private

  def authenticate_request
    render json: { error: "Unauthorized" }, status: :unauthorized unless current_user_id && authorized_user?
  end

  def authorized_user?
    current_user&.user? || current_user&.admin_clerk?
  end

  def set_voter
    @voter = Voter.find_by(id_number: params[:id])
    raise ActiveRecord::RecordNotFound, "Voter not found" if @voter.nil?
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: "Voter not found" }, status: :not_found
  end

  def voter_params
    birth_date = params.dig(:voter, :date_of_birth) || Date.today.to_s
    params.require(:voter).permit(:id_number, :full_names, :sex, :county, :subcounty, :national, :email, :ward_id, :date_of_birth)
          .merge(
            date_of_birth: birth_date.blank? ? nil : Date.parse(birth_date),
            age: calculate_age(birth_date.blank? ? nil : Date.parse(birth_date), Date.today),
            ward_id: params[:ward_id],
            user_id: current_user.id
          )
  end

  def calculate_age(birth_date, current_date)
    age = current_date.year - birth_date.year
    age -= 1 if birth_date.month > current_date.month || (birth_date.month == current_date.month && birth_date.day > current_date.day)
    age
  end

  def handle_record_invalid(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def handle_record_not_found(exception)
    render json: { error: "Record not found" }, status: :not_found
  end

  def handle_record_not_unique(exception)
    render json: { error: "Duplicate record" }, status: :unprocessable_entity
  end
end
