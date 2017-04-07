class VideosController < ApplicationController
  # before_filter :authorize
  before_filter :user_admin?

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new()
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to videos_path,  notice: t('views.course.create')
    else
      render action: 'new'
    end

  end

  def destroy
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :url, :course_id)
  end
end
