class User < ApplicationRecord
  has_secure_password
  validates :email, :uniqueness => true
  has_many :promoter_followers
  has_many :promoters, through: :promoter_followers
  has_many :guestlists
  has_many :clubs, through: :guestlists
  has_many :promotions, through: :guestlists
  has_many :guests, through: :guestlists
  has_many :images
  has_many :comments
  has_many :comments, through: :comments
end
