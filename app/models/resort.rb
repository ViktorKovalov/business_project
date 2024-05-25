class Resort < ApplicationRecord
  has_many :resting_places, dependent: :destroy
  has_many_attached :images
end
