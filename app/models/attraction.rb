class Attraction < ApplicationRecord
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :activity_types
  #validates :place_id, uniqueness: { case_sensitive: true }
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
