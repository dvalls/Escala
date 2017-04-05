class MyCourse::HomeController < MyCourse::MyCourseAreaController # ApplicationController
  def index
    @carousels = Carousel.all.order(order: :asc)
  end
end
