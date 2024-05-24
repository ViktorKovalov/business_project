# frozen_string_literal: true

class FeedbackRequestsController < ApplicationController
  def new
    @feedback_request = FeedbackRequest.new
  end

  def create
    @feedback_request = FeedbackRequest.new(feedback_request_params)

    if @feedback_request.save
      FeedbackMailer.feedback_received(@feedback_request).deliver_now

      redirect_to contact_path, flash: { success: 'Your message has been sent. Thank you for your message!' }
    else
      render :new, flash: { warning: 'Oops, something went wrong. Please try again.' }
    end
  end

  private

  def feedback_request_params
    params.require(:feedback_request).permit(:name, :email, :phone_number, :message)
  end
end
