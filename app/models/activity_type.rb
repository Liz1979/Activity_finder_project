class ActivityType < ApplicationRecord
  has_many :attractions
  validates :name, presence: true
end
