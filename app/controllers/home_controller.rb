class HomeController < ApplicationController
  # Этот контроллер будет использоваться для отображения главной страницы (лендинг-пейджа), которая содержит информацию
  # об отелях, отзывы, форму обратной связи и другие общие элементы.
  def index
    @resorts = Resort.all
    @feedback_request = FeedbackRequest.new
  end
end
