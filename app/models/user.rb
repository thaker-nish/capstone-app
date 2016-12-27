class User < ApplicationRecord
  has_secure_password
  has_many :promoter_followers
  has_many :promoters, through: :promoter_followers
  has_many :guestlists
  has_many :clubs, through: :guestlists
  has_many :promotions, through: :guestlists
  has_many :guests, through: :guestlists
end
