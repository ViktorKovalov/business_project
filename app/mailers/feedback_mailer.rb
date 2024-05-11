class FeedbackMailer < ApplicationMailer
  default from: "from@example.com"

  def feedback_received(feedback)
    @feedback = feedback

    RestClient.post "https://api:977123371671971ba48963170778ab1b-ed54d65c-c36217eb"\
      "@api.mailgun.net/v3/sandboxc67ad3db61904d9796af8bc0cd5e63da.mailgun.org/messages",
      :from => "Excited User <mailgun@sandboxc67ad3db61904d9796af8bc0cd5e63da.mailgun.org>",
      :to => "vityan97@gmail.com",
      :subject => "Feedback Received",
      :text => "Your feedback has been received. Thank you for choosing our service."
  end
end
