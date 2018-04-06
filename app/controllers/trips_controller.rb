class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
  end

  def new
    passenger = Passenger.find_by(id: params[:passenger_id])

    driver = Driver.all.sample
    cost = 999
    date = Date.today
    rating = nil

    @trip = Trip.new(passenger: passenger, driver: driver, date: date, cost: cost, rating: rating)
    if @trip.save
      redirect_to passenger_path(@trip[:passenger_id])
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    if @trip.update trip_params
      redirect_to trip_path
    else render :edit
    end


  end
  def index
    @trips = Trip.all
  end

  def destroy
    id = params[:id]
    @trip = Trip.find(id)
    if @trip
      @trip.destroy
    end
    redirect_to trips_path
  end


  def create
    passenger = Passenger.find_by(id: params[:passenger_id])
    driver = Driver.all.sample
    cost = 999
    date = Date.today
    rating = nil
    @trip = Trip.new(passenger: passenger, driver: driver, date: date, cost: cost, rating: rating)
    @trip.save
  end


  private
  def trip_params
    return params.require(:trip).permit(:id, :driver_id, :passenger_id, :date, :rating, :cost)
  end
end
