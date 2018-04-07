class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  # validates :driver_id, presence: true
  # validates :passenger_id, presence: true
  def self.request(passenger)
    raise ArgumentError unless passenger.new_trip_ok?
    driver = Driver.all.sample
    cost = 999
    date = Date.today
    rating = nil
    Trip.new(passenger: passenger, driver: driver, date: date, cost: cost, rating: rating)
  end



end
