class BookingMailer < ApplicationMailer
  require "rest-client"

  default to: "vityan97@gmail.com"
  default from: "from@example.com"

  def booking_confirmation(booking_enquiry)
    @booking_enquiry = booking_enquiry

    RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
      "@api.mailgun.net/v3/#{ENV['MAILGUN_DOMAIN']}/messages",
      :from => "Excited User <mailgun@#{ENV['MAILGUN_DOMAIN']}>",
      :to => "vityan97@gmail.com",
      :subject => "Booking Confirmation",
      :text => "Your booking has been confirmed. Thank you for choosing our service."
  end
end
