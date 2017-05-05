class HomeController < ApplicationController
  def index
    @feeds = Feed.limit(5)
    @carousels = Carousel.all.order(order: :asc)
  end
end
