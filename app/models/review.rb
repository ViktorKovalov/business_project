class Review < ApplicationRecord
  belongs_to :user
  belongs_to :resting_place

  validates :content, presence: true, length: { maximum: 300 }
end
