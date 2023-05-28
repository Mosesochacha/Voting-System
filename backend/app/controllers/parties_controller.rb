class PartiesController < ApplicationController
  before_action :set_party, only: %i[show update destroy]

  # GET /parties
  def index
    parties = Party.all
    render json: parties, status: :ok
  end

  # GET /parties/1
  def show
    render json: @party, status: :ok
  end

  # POST /parties
  def create
    party = Party.new(party_params)

    if party.save
      render json: party, status: :created, location: party
    else
      render json: { error: party.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /parties/1
  def update
    if @party.update(party_params)
      render json: @party, status: :ok
    else
      render json: { error: @party.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # DELETE /parties/1
  def destroy
    if @party.destroy
      render json: { message: "Party has been deleted" }, status: :ok
    else
      render json: { error: @party.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_party
    @party = Party.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Party not found" }, status: :not_found
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # Only allow a list of trusted parameters through.
  def party_params
    params.require(:party).permit(:name, :image, :party_code, :abbreviation, :symbol_name)
  end
end
