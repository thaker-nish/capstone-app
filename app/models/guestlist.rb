class Guestlist < ApplicationRecord
  belongs_to :user
  belongs_to :promoter
  belongs_to :club
  belongs_to :promotion
end
