class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])


  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    @trip.driver_id = trip_params[:driver_id]
    @trip.passenger_id = trip_params[:passenger_id]
    @trip.date = trip_params[:date]
    @trip.rating = trip_params[:rating]

    if @trip.update trip_params
      redirect_to trip_path
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
    @trip = Trip.new
    @trip.date = DateTime.now
    @trip.cost = rand(9999)
    @trip.driver_id = Driver.all.where(available: true).sample
    @trip.passenger_id = Passenger.find_by(id: params[:passenger_id]).id
    if @trip.save
      redirect_to trip_path(@trip)
    else
      raise ArgumentError.new("Error: Trip not created.")
    end
  end

  private
  def trip_params
    return params.require(:trip).permit(:id, :driver_id, :passenger_id, :date, :rating, :cost)
  end
end
