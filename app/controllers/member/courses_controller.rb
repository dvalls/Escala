class Member::CoursesController < Member::MemberAreaController # ApplicationController
  before_action :student_logged?

  def show
    @course = Course.friendly.find(params[:id])
    @pages = @course.pages
  end
end
