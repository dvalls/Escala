class Member::ContentVideosController < Member::MemberAreaController # ApplicationController

  before_action :set_student, only: [:index, :show]
  before_action :student_logged?

  def index
    @student = get_student
    @course = Course.friendly.find(params[:course_id])
    @content_videos = ContentVideo.all.order(title: :asc)#.order(course_id: :asc)#.where( :course_id => @course.id)
  end

  def show
    @student = get_student
    # @course = Course.friendly.find(params[:course_id])

    @content_video = ContentVideo.find(params[:id])
    @course = Course.find(params[:course_id])
  end


  private

  def set_student
    @student = get_student
  end
end
