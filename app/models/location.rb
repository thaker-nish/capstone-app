class Location < ApplicationRecord
  has_many :club_locations
  has_many :clubs, through: :club_locations
  has_many :images
end
