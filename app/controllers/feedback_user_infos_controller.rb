# frozen_string_literal: true

# Контроллер для обработки запросов, связанных с данными пользователей в рамках формы обратной связи.
class FeedbackUserInfosController < ApplicationController
  # Используется для обработки формы обратной связи или контактной формы. Этот контроллер может обрабатывать отправку
  # формы и выполнять действия, например, отправку письма владельцу или сохранение данных в базе данных.
  def create
    puts "Received parameters: #{params.inspect}"
    # params_to_use = {
    #   name: params[:name],
    #   email: params[:email],
    #   phone_number: params[:phone_number],
    #   message: params[:message]
    # }
    @feedback_user_info = FeedbackUserInfo.new(user_params)

    if @feedback_user_info.save
      redirect_to root_path, notice: 'Thank you for your message!'
    else
      flash[:alert] = 'Oops, something went wrong. Please try again.'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:feedback_user_info).permit(:name, :email, :phone_number, :message)
  end
end
