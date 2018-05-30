class Member::ContentVideosController < Member::MemberAreaController # ApplicationController
  layout 'member'
  before_action :student_logged?

  def show
    @block = ContentBlock.find(params[:block_id])
    @course = Course.find(@block.contentable.course_id)
    @pages = @course.pages.order(:name)
    @content_video = ContentVideo.find(params[:id])

    authorize @content_video
    authorize @block
    authorize @course
  end
end
