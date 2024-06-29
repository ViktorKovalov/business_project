class RestingPlacesController < ApplicationController
  before_action :find_resort
  def new
    @resting_place = @resort.resting_places.build
  end

  def create
    @resting_place = @resort.resting_places.build(resting_place_params)

    if @resting_place.save
      redirect_to @resort, notice: "Resting Place was successfully created."
    else
      render :new
    end
  end
  def show
    @resting_place = RestingPlace.find(params[:id])
    @booking_enquiry = @resting_place.booking_enquiries.build
  end

  private

  def find_resort
    @resort = Resort.find(params[:resort_id])
  end

  def resting_place_params
    params.require(:resting_place).permit(:room_number, :room_description, :bed_count, :price_per_night)
  end
end
