class BookingMailer < ApplicationMailer
  require "rest-client"

  default to: "vityan97@gmail.com"
  default from: "from@example.com"

  def booking_confirmation(booking_enquiry)
    @booking_enquiry = booking_enquiry

    RestClient.post "https://api:977123371671971ba48963170778ab1b-ed54d65c-c36217eb"\
      "@api.mailgun.net/v3/sandboxc67ad3db61904d9796af8bc0cd5e63da.mailgun.org/messages",
      :from => "Excited User <mailgun@sandboxc67ad3db61904d9796af8bc0cd5e63da.mailgun.org>",
      :to => "vityan97@gmail.com",
      :subject => "Booking Confirmation",
      :text => "Your booking has been confirmed. Thank you for choosing our service."
  end
end
