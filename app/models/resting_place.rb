class RestingPlace < ApplicationRecord
  belongs_to :resort
  has_many :booking_enquiries
end
