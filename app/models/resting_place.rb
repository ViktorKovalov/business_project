class RestingPlace < ApplicationRecord
  belongs_to :resort
  has_many :reviews
  has_many :booking_enquiries
end
