class CountiesController < ApplicationController
  before_action :set_county, only: %i[ show update destroy ]

  # GET /counties
  def index
    @counties = County.all

    render json: @counties
  end

  # GET /counties/1
  def show
    render json: @county
  end

  # POST /counties
  def create
    @county = County.new(county_params)

    if @county.save
      render json: @county, status: :created, location: @county
    else
      render json: @county.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /counties/1
  def update
    if @county.update(county_params)
      render json: @county
    else
      render json: @county.errors, status: :unprocessable_entity
    end
  end

  # DELETE /counties/1
  def destroy
    @county.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_county
      @county = County.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def county_params
      params.require(:county).permit(:name, :national_id)
    end
end
