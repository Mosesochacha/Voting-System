class SubcountiesController < ApplicationController
  before_action :set_subcounty, only: %i[show update destroy]

  # GET /subcounties
  def index
    @subcounties = Subcounty.all

    render json: @subcounties
  end

  # GET /subcounties/1
  def show
    render json: @subcounty
  end

  # POST /subcounties
  def create
    @subcounty = Subcounty.new(subcounty_params)

    begin
      if @subcounty.save
        render json: @subcounty, status: :created, location: @subcounty
      else
        render json: @subcounty.errors, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subcounties/1
  def update
    begin
      if @subcounty.update(subcounty_params)
        render json: @subcounty
      else
        render json: @subcounty.errors, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  # DELETE /subcounties/1
  def destroy
    begin
      @subcounty.destroy
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subcounty
    @subcounty = Subcounty.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def subcounty_params
    params.require(:subcounty).permit(:name, :county_id)
  end
end
