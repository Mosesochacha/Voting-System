class NationalsController < ApplicationController
  before_action :set_national, only: %i[ show update destroy ]

  # GET /nationals
  def index
    @nationals = National.all

    render json: @nationals
  end

  # GET /nationals/1
  def show
    render json: @national
  end

  # POST /nationals
  def create
    @national = National.new(national_params)

    if @national.save
      render json: @national, status: :created, location: @national
    else
      render json: @national.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nationals/1
  def update
    if @national.update(national_params)
      render json: @national
    else
      render json: @national.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nationals/1
  def destroy
    @national.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_national
      @national = National.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def national_params
      params.require(:national).permit(:name)
    end
end
