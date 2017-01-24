class Promoter < ApplicationRecord
  has_secure_password
  has_many :promoter_followers
  has_many :users, through: :promoter_followers
  has_many :club_promoters
  has_many :clubs, through: :club_promoters
  has_many :promotions, through: :guestlists
  has_many :guestlists
  has_many :guests, through: :guestlists
  has_many :images
  has_many :comments
end
