class HomeController < ApplicationController
  def index
    @feeds = Feed.limit(5)
    @carousels = Carousel.all.order(order: :asc)

    @categories = Category.all
    @courses = Course.all
  end
end
