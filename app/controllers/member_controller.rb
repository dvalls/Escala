class MemberController < ApplicationController
  before_action :set_courses, only: [:index, :show]

  before_filter :student_logged?

  def home
    @carousels = Carousel.all.order(order: :asc)
  end


  def index
    @student = get_student
    render layout: 'application'
  end

  def show
    @course = Course.friendly.find(params[:id])
    @pages = @course.pages
    render layout: 'member'
  end

  private

  def set_courses
    case session[:admin]
      when true
        @courses = Course.all
      when false
        @courses = get_student.courses
    end
  end
end
