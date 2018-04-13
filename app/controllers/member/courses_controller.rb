class Member::CoursesController < Member::MemberAreaController # ApplicationController
  before_action :student_logged?

  def show
    @course = Course.friendly.find(params[:id])

    authorize @course
    @pages = @course.pages.order(:name)
  end
end
