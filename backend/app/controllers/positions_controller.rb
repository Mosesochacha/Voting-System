# app/controllers/positions_controller.rb
class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :update, :destroy]

  def index
    @positions = Position.all
    render json: @positions
  end

  def show
    render json: @position
  end

  def create
    @position = Position.new(position_params)

    if @position.save
      render json: @position, status: :created, location: @position
    else
      render json: @position.errors, status: :unprocessable_entity
    end
  end

  def update
    if @position.update(position_params)
      render json: @position
    else
      render json: @position.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @position.destroy
  end

  private

  def set_position
    @position = Position.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: "Position not found" }, status: :not_found
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def position_params
    params.require(:position).permit(:name)
  end
end
