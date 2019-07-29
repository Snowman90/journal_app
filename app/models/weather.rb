class Weather < ApplicationRecord
  has_one :city

  validates_presence_of :temperature
end
