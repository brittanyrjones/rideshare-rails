class Passenger < ApplicationRecord
  has_many :trips
  validates :name, :phone_num, presence: true

  def total_money_spent
    total_spent = 0
    trips.each {|trip| total_spent += trip.cost}
    return total_spent
  end

  def new_trip_ok?
  trips.each do |trip|
      return false if trip.rating.nil?
    end
    true
  end

end
