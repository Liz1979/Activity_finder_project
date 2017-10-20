class Location < ApplicationRecord
  has_and_belongs_to_many :attractions
  validates :address, uniqueness: { case_sensitive: false }
  validates :search, presence: true
  geocoded_by :search do |obj,results|
    if geo = results.first
      obj.name = geo.address.split(',').first.upcase
      obj.city    = geo.city.upcase
      obj.country = geo.country_code.upcase
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
      obj.address = geo.address.upcase
    end
  end
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
