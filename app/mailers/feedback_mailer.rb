class FeedbackMailer < ApplicationMailer
  default from: "from@example.com"

  def feedback_received(feedback_request)
    @feedback_request = feedback_request

    RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
      "@api.mailgun.net/v3/#{ENV['MAILGUN_DOMAIN']}/messages",
      from: "support <mailgun@#{ENV['MAILGUN_DOMAIN']}> ", # Указываем адрес отправителя
      to: "vik.kovalov@yandex.ru",
      subject: "Feedback Received",
      text: feedback_message # Указываем текст письма
  end

  private

  # Приватный метод для формирования текста сообщения
  def feedback_message
    <<~MESSAGE
      New Feedback Received from #{@feedback_request.email}

      User Information:
      Name: #{@feedback_request.name}
      Email: #{@feedback_request.email}
      Phone Number: #{@feedback_request.phone_number}
      Message: #{@feedback_request.message}
    MESSAGE
  end
end
