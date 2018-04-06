class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    @passenger.save ? (redirect_to passengers_path) : (render :new)
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])
    if !@passenger.nil?
      if @passenger.update(passenger_params)
        redirect_to passenger_path(@passenger.id)
      else
        render :edit
      end
    else
      redirect_to passenger_path
    end
  end

  def show
    id = params[:id]
    @passenger = Passenger.find_by(id: params[:id])
    @passenger_trips = @passenger.trips
    return @passenger_trips
  end

  def destroy
    id = params[:id]
    @passenger = Passenger.find(id)
    if @passenger
      @passenger.destroy
    end
    redirect_to passengers_path
  end

  def new_trip
       @passenger = Passenger.find(params[:id])
       puts @passenger.attributes
       if new_trip_ok?
           avail_drivers = Driver.all.map { |driver| driver unless driver.trips.any? { |trip| trip.rating.nil? } }
           driver = avail_drivers.sample
           trip = @rider.trips.create(driver_id: driver.id, cost: 0.0, date: Time.now)
       end
       redirect_to rider_path
   end

   def new_trip_ok?
           @rider.trips.each do |trip|
               return false if trip.rating.nil?
           end
           true
       end
  private

  def passenger_params
    return params.require(:passenger).permit( :name, :phone_num)
  end
end
