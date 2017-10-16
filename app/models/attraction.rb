class Attraction < ApplicationRecord
  has_and_belongs_to_many :locations
  belongs_to :activity_type
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
