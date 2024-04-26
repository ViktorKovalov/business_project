class FeedbackRequest < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/, message: "Is not a valid email" }
  validates :phone_number, presence: true,
                           format: { with: /\A\d+\z/, message: 'The number must contain only digits' }
  validates :message, presence: true, length: { maximum: 500, message: 'The message is too long' }
end
