class ClubPromoter < ApplicationRecord
  belongs_to :club
  belongs_to :promoter
end
