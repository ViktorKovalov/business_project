# frozen_string_literal: true

# Используется для обработки формы обратной связи или контактной формы. Этот контроллер может обрабатывать отправку
# формы и выполнять действия, например, отправку письма владельцу или сохранение данных в базе данных.
class FeedbackRequestsController < ApplicationController
  def create
    @feedback_request = FeedbackRequest.new(user_params)

    if @feedback_request.save
      redirect_to root_path, notice: 'Thank you for your message!'
    else
      flash[:alert] = 'Oops, something went wrong. Please try again.'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:feedback_request).permit(:name, :email, :phone_number, :message)
  end
end
