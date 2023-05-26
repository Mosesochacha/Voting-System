class VotersController < ApplicationController
  before_action :set_voter, only: [:show, :update, :destroy]

  # POST /voters/register
  def register_voter
    ward = Ward.find_by(id: params[:ward_id])

    if ward.nil?
      render json: { error: "Invalid ward" }, status: :unprocessable_entity
      return
    end

    @voter = Voter.new(voter_params)
    @voter.county = ward.subcounty.county.name
    @voter.subcounty = ward.subcounty.name
    @voter.national = ward.subcounty.county.national.name

    begin
      @voter.save!
      render json: @voter, status: :created
    rescue ActiveRecord::RecordNotUnique => e
      if e.message.include?("id_number")
        render json: { error: "ID number already registered" }, status: :unprocessable_entity
      elsif e.message.include?("email")
        render json: { error: "Email already exists" }, status: :unprocessable_entity
      else
        render json: { error: "Record not unique" }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /voters
  def index
    @voters = Voter.all
    render json: @voters
  end

  # GET /voters/1
  def show
    render json: @voter.as_json(include: { ward: { include: { subcounty: { include: :county } } } })
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  # PATCH/PUT /voters/1
  def update
    if @voter.update(voter_params)
      render json: @voter
    else
      render json: { error: @voter.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /voters/1
  def destroy
    @voter.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_voter
    @voter = Voter.find_by(id_number: params[:id])
    raise ActiveRecord::RecordNotFound, "Voter not found" if @voter.nil?
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def voter_params
    birth_date = params.dig(:voter, :date_of_birth) || Date.today.to_s

    params.require(:voter).permit(:id_number, :full_names, :sex, :county, :subcounty, :national, :email, :ward_id)
          .merge(
            date_of_birth: birth_date.blank? ? nil : Date.parse(birth_date),
            age: calculate_age(birth_date.blank? ? nil : Date.parse(birth_date), Date.today),
            ward_id: params[:ward_id],
          )
  end

  def calculate_age(birth_date, current_date)
    age = current_date.year - birth_date.year
    age -= 1 if birth_date.month > current_date.month || (birth_date.month == current_date.month && birth_date.day > current_date.day)
    age
  end
end
