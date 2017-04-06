class MyCourseController < ApplicationController
  # before_action :set_course, only: [:show]

  layout 'application'

  def home
    @carousels = Carousel.all.order(order: :asc)

  end


  def index
    @student = get_student
  end

  def show
    @student = get_student

    @course = Course.friendly.find(params[:id])
  end

end
