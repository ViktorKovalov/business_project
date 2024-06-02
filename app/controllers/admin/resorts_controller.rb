# frozen_string_literal: true

class Admin::ResortsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_resort, only: %i[show edit update destroy]
  def index
    @resorts = Resort.all
  end

  def show; end

  def new
    @resort = Resort.new
  end

  def create
    @resort = Resort.new(resort_params)
    if @resort.save
      redirect_to admin_resort_path(@resort)
      flash[:success] = 'Resort was successfully created.'
    else
      render :new
    end

    def edit; end

    def update
      if @resort.update(resort_params.except(:images))
        @resort.images.attach(params[:resort][:images]) if params[:resort][:images].present?
        redirect_to admin_resorts_path
        flash[:success] = 'Resort was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @resort.destroy
      redirect_to root_path
      flash[:success] = 'Resort was successfully deleted.'
    end

    def delete_image
      image = @resort.images.find(params[:image_id])
      image.purge
      head :no_content
    end

    private

    def set_resort
      @resort = Resort.find(params[:id])
    end

    def resort_params
      params.require(:resort).permit(:title, :description, :location, images: [])
    end
  end
end
