class Member::ContentVideosController < Member::MemberAreaController # ApplicationController
  before_action :student_logged?

  def show
    @course = Course.find(params[:course_id])
    @pages = @course.pages
    @content_video = ContentVideo.find(params[:id])
    @video_groups = @content_video.content_video_groups.where(:course_id => @course.id)
  end
end
