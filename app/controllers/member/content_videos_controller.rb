class Member::ContentVideosController < Member::MemberAreaController # ApplicationController
  before_action :student_logged?

  def show
    @block = ContentBlock.find(params[:block_id])
    @course = Course.find(@block.contentable.course_id)
    @pages = @course.pages
    @content_video = ContentVideo.find(params[:id])
    # @video_groups = block.contentable #@content_video.content_video_groups.where(:course_id => @course.id)
  end
end
