class ReviewsController < ApplicationController
  before_action :find_resting_place
  before_action :find_review, only: [:destroy]

  def create
    @review = @resting_place.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to [@resting_place.resort, @resting_place]
      flash[:success] = 'Review was successfully created.'
    else
      redirect_to [@resting_place.resort, @resting_place]
      flash[:alert] = 'There was an error creating the review.'
    end
  end

  def destroy
    if @review.user == current_user
      @review.destroy
      flash[:success] = 'Review was successfully deleted.'
    else
      flash[:alert] = 'You can only delete your own reviews.'
    end
    redirect_to [@resting_place.resort, @resting_place]
  end

  private

  def find_resting_place
    @resting_place = RestingPlace.find(params[:resting_place_id])
  end

  def find_review
    @review = @resting_place.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
