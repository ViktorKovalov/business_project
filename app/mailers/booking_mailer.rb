class BookingMailer < ApplicationMailer
  require 'rest-client' # Подключаем библиотеку RestClient для отправки HTTP-запросов

  default to: 'vik.kovalov@yandex.ru' # Устанавливаем адрес по умолчанию для отправки
  default from: 'from@example.com' # Устанавливаем адрес отправителя по умолчанию

  # Метод для отправки письма с подтверждением бронирования
  def booking_confirmation(booking_enquiry)
    @booking_enquiry = booking_enquiry # Сохраняем объект booking_enquiry в переменную экземпляра
    @resting_place = booking_enquiry.resting_place # Получаем связанный объект resting_place
    @resort = @resting_place.resort # Получаем связанный объект resort

    # Отправляем HTTP POST-запрос к Mailgun API для отправки письма
    RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
      "@api.mailgun.net/v3/#{ENV['MAILGUN_DOMAIN']}/messages",
      from: "support <mailgun@#{ENV['MAILGUN_DOMAIN']}> ", # Указываем адрес отправителя
      to: 'vik.kovalov@yandex.ru', # Указываем адрес получателя (email клиента)
      subject: 'Booking Confirmation', # Указываем тему письма
      text: booking_message # Указываем текст письма
  end

  private

  # Приватный метод для формирования текста сообщения
  def booking_message
    <<~MESSAGE
      Booking Confirmation

      User Information:🎅
      Name: #{@booking_enquiry.name}
      Email: #{@booking_enquiry.email}
      Phone Number: #{@booking_enquiry.phone_number}
      Check-in Date: #{@booking_enquiry.check_in_date}
      Check-out Date: #{@booking_enquiry.check_out_date}
      Additional Information: #{@booking_enquiry.additional_information}

      Booking Information:✅
      Resting Place: #{@resting_place.resort.title}
      Room Number: #{@resting_place.room_number}
      Room Description: #{@resting_place.room_description}
      Bed Capacity: #{@resting_place.bed_count}
      Price per Night: #{@resting_place.price_per_night}$

      Thank you for choosing our service.
    MESSAGE
  end
end
