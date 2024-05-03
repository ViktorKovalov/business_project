class RestingPlacesController < ApplicationController
  def show
    @resort = Resort.find(params[:resort_id])
    @resting_place = RestingPlace.find(params[:id])
    @booking_enquiry = @resting_place.booking_enquiries.build
  end
end
