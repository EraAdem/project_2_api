# frozen_string_literal: true

class FlightsController < ProtectedController
  # ApplicationController
  before_action :set_flight, only: %i[show update destroy]

  # GET /flights
  def index
    @flights = Flight.all
    # @flights = current_user.flights

    render json: @flights
  end

  # GET /flights/1
  def show
    render json: Flight.find(params[:id])
    # render json: @flight
  end

  # POST /flights
  def create
    # @flight = Flight.new(flight_params)
    @flight = current_user.flights.build(flight_params)

    if @flight.save
      render json: @flight, status: :created, location: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flights/1
  def update
    if @flight.update(flight_params)
      render json: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # DELETE /flights/1
  def destroy
    @flight.destroy
  end

  # private

  # Use callbacks to share common setup or constraints between actions.
  def set_flight
    # @flight = Flight.find(params[:id])
    @flight = current_user.flights.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def flight_params
    params.require(:flight).permit(:place, :date, :description, :user_id)
    # params.require(:flight).permit(:place,:date,:description)
  end
  private :set_flight, :flight_params
end
