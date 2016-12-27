class Club < ApplicationRecord
  has_many :club_promoters
  has_many :promoters, through: :club_promoters
  has_many :promotions, through: :guestlists
  has_many :guestlists
  has_many :users, through: :guestlists
  has_many :guests, through: :guestlists
end
