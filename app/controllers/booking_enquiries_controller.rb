class BookingEnquiriesController < ApplicationController
  def new
    @resting_place = RestingPlace.find(params[:resting_place_id])
    @booking_enquiry = BookingEnquiry.new
  end

  def create
    @resting_place = RestingPlace.find(params[:resting_place_id])
    @booking_enquiry = @resting_place.booking_enquiries.build(booking_enquiry_params)

    if @booking_enquiry.save
      redirect_to root_path
      flash[:success] = 'Your message has been sent. Thank you for your message!'
    else
      p @booking_enquiry.errors.full_messages
      redirect_to resort_path(@resting_place.resort)
      flash[:warning] = 'Oops, something went wrong. Please try again.'
    end
  end

  private

  def booking_enquiry_params
    params.require(:booking_enquiry)
          .permit(:name, :email, :phone_number, :check_in_date,
                  :check_out_date, :additional_information,
                  :resting_place_id)
  end
end
