class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates_numericality_of :rating, :less_than_or_equal_to => 5, :message => "rating must be less than or equal to 5"
end
