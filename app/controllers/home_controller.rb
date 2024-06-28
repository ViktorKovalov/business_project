class HomeController < ApplicationController
  # Этот контроллер будет использоваться для отображения главной страницы (лендинг-пейджа), которая содержит информацию
  # об отелях, отзывы, форму обратной связи и другие общие элементы.
  def index
    page_number = params[:page].presence || 1
    @resorts = Resort.order(created_at: :asc).page(page_number.to_i).per(2)
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
      render :new, status: :unprocessable_entity
    end
  end

  private

  def resort_params
    params.require(:resort).permit(:title, :description, :location, images: [])
  end
end
