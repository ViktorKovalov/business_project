class ReviewsController < ApplicationController
  def index

  end

  def new
    @review = Review.new
  end

  def create

  end

  def edit
    @review = Review.find(params[:id])
  end

  def update

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def review_params
end
