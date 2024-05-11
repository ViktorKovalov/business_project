# frozen_string_literal: true

# Используется для обработки формы обратной связи или контактной формы. Этот контроллер может обрабатывать отправку
# формы и выполнять действия, например, отправку письма владельцу или сохранение данных в базе данных.
class FeedbackRequestsController < ApplicationController
  def create
    @feedback_request = FeedbackRequest.new(user_params)

    if @feedback_request.save
      FeedbackMailer.feedback_received(@feedback_request).deliver_now

      redirect_to root_path
      flash[:success] = 'Your message has been sent. Thank you for your message!'
    else
      redirect_to root_path
      flash[:warning] = 'Oops, something went wrong. Please try again.'
    end
  end

  private

  def user_params
    params.require(:feedback_request).permit(:name, :email, :phone_number, :message)
  end
end
