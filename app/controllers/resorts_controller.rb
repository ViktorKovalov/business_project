# frozen_string_literal: true

class ResortsController < ApplicationController
  def show
    @resort = Resort.find(params[:id])
    @resting_places = @resort.resting_places
  end

  def new
    @resort = Resort.new
  end

  def create
    @resort = Resort.new(resort_params)
    if @resort.save
      redirect_to @resort, notice: 'Resort was successfully created.'
    else
      render :new
    end
  end

  def edit
    @resort = Resort.find(params[:id])
  end

  def update
    @resort = Resort.find(params[:id])

    # Обновляем все атрибуты кроме изображений
    if @resort.update(resort_params.except(:images))
      # Если пришли новые изображения, добавляем их к существующим
      @resort.images.attach(params[:resort][:images]) if params[:resort][:images].present?
      redirect_to @resort
      flash[:success] = 'Resort was successfully updated.'
    else
      render :edit
    end
  end


  private

  def resort_params
    params.require(:resort).permit(:title, :description, :location, images: [])
  end
end
