class Location < ApplicationRecord
  validates :name, presence: true
  validates :country, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
