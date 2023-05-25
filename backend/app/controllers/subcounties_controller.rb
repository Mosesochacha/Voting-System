class SubcountiesController < ApplicationController
  before_action :set_subcounty, only: %i[ show update destroy ]

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

    if @subcounty.save
      render json: @subcounty, status: :created, location: @subcounty
    else
      render json: @subcounty.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subcounties/1
  def update
    if @subcounty.update(subcounty_params)
      render json: @subcounty
    else
      render json: @subcounty.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subcounties/1
  def destroy
    @subcounty.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcounty
      @subcounty = Subcounty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subcounty_params
      params.require(:subcounty).permit(:name, :county_id)
    end
end
