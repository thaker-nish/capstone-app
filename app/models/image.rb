class Image < ApplicationRecord
  belongs_to :club, optional: true
  belongs_to :promoter, optional: true
  belongs_to :user, optional: true
  belongs_to :location, optional: true
end
