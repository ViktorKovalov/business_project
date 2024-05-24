class StaticPagesController < ApplicationController
  def about; end
  def contact
    @feedback_request = FeedbackRequest.new
  end
  def terms; end
end
