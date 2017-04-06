class Member::HomeController < Member::MemberAreaController # ApplicationController
  def index
    @carousels = Carousel.all.order(order: :asc)
  end
end
