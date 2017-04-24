class MemberController < ApplicationController
  before_action :set_courses, only: [:index, :show]

  before_filter :student_logged?

  layout 'application'

  def home
    @carousels = Carousel.all.order(order: :asc)
  end


  def index
    @student = get_student
  end

  def show
    @course = Course.friendly.find(params[:id])
    @pages = @course.pages
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
