class PromoterMessage < ApplicationRecord
  belongs_to :promoter
  belongs_to :user
end
