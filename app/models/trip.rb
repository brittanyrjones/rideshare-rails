class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger


  validates :driver_id, presence: true
  validates :passenger_id, presence: true
  validates :date, presence: true
  validates :rating, presence: true, inclusion: { in: (0..5) }


end
