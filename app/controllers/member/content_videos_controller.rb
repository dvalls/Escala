class Member::ContentVideosController < Member::MemberAreaController # ApplicationController
  before_action :student_logged?

  def show
    @block = ContentBlock.find(params[:block_id])
    @course = Course.find(@block.contentable.course_id)
    @pages = @course.pages
    @content_video = ContentVideo.find(params[:id])

    authorize @content_video
    authorize @block
    authorize @course
  end
end
