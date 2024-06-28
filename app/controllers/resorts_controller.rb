# frozen_string_literal: true

class ResortsController < ApplicationController
  before_action :set_resort, only: %i[show edit update destroy delete_image]
  def show
    @resting_places = @resort.resting_places
  end

  def new
    @resort = Resort.new
  end

  def create
    @resort = Resort.new(resort_params)
    if @resort.save
      redirect_to @resort
      flash[:success] = 'Resort was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    # Обновляем все атрибуты кроме изображений
    if @resort.update(resort_params.except(:images))
      # Если пришли новые изображения, добавляем их к существующим
      @resort.images.attach(params[:resort][:images]) if params[:resort][:images].present?
      redirect_to root_path
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
