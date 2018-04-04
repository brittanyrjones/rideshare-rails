class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passengers = Passenger.new
      if @passenger.save
        redirect_to passenger_path
      else
        render :new
      end
    end

  def edit
    @passenger = Passenger.find_by(id)
  end

  def update
    @passenger = Passgener.find_by(id: params[:id])
    if !@passenger.nil?
      if @passenger.update(params[:title]) == nil
        elsif @book.update
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
    @passenger = Passenger.find(id)

    @passenger_trips = @passenger.trips

    # @passenger_trips_cost = @passenger_trips.cost.sum
    #
    # return @passenger_trips_cost

  end

  def delete
    id = params[:id]
    @passenger = Passenger.find(id)
    if @passenger
      @passenger.destroy
    end
    redirect_to passenger_path
  end

  private

  def passenger_params
    return params.require(:passenger).permit( :name, :phone_num)
  end
end
