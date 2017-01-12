class Promotion < ApplicationRecord
  has_many :guestlists
  belongs_to :promoter
end
