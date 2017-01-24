class UserMessage < ApplicationRecord
  belongs_to :user
  belongs_to :promoter
end
