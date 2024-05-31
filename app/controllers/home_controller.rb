class HomeController < ApplicationController
  # Этот контроллер будет использоваться для отображения главной страницы (лендинг-пейджа), которая содержит информацию
  # об отелях, отзывы, форму обратной связи и другие общие элементы.
  def index
    page_number = params[:page].presence || 1
    @resorts = Resort.order(created_at: :asc).page(page_number.to_i).per(2)
  end
end
