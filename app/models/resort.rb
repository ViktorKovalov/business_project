class Resort < ApplicationRecord
  has_many :resting_places, dependent: :destroy
end
