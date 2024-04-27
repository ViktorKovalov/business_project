class RestingPlacesController < ApplicationController
  def show
    @resort = Resort.find(params[:resort_id])
    @resting_place = RestingPlace.find(params[:resting_place])
  end
end
