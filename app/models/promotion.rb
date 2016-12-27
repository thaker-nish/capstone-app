class Promotion < ApplicationRecord
  has_many :guestlists
  belongs_to :club
  belongs_to :promoter
end
