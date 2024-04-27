# frozen_string_literal: true

# Используется для управления информацией об отелях. Включает действия для отображения списка отелей, а также для
# показа подробной информации о каждом отеле.
class ResortsController < ApplicationController
  def show
    @resort = Resort.find(params[:id])
    @resting_places = @resort.resting_places
  end
end
