class Member::VideosController < Member::MemberAreaController # ApplicationController

  before_action :set_student, only: [:index, :show]
  before_action :student_logged?

  def index
    @student = get_student
    @course = Course.friendly.find(params[:course_id])
    @videos = Video.all.where( :course_id => @course.id)
  end

  def show
    @student = get_student
    # @course = Course.friendly.find(params[:course_id])

    @video = Video.find(params[:id])
    @course = Course.find(@video.course_id)
  end


  private

  def set_student
    @student = get_student
  end
end
