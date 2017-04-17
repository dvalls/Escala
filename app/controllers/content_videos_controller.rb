class ContentVideosController < ApplicationController
  before_filter :user_admin?
  before_action :set_video, only: [:edit, :update, :destroy]

  def index
    @content_videos = ContentVideo.order(title: :asc)
    @video_groups = ContentVideoGroup.all
  end

  def new
    @content_video = ContentVideo.new()
  end

  def create
    @content_video = ContentVideo.new(video_params)

    if @content_video.save
      redirect_to content_videos_path,  notice: t('views.course.create')
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @content_video.update(video_params)
      redirect_to content_videos_path
    else
      flash[:notice] = 'verificar as cagadas'
      render :edit
    end
  end

  def destroy
    @content_video.destroy
    redirect_to content_videos_path, warning: 'ContentVideo excluído'
  end

  private

  def video_params
    params.require(:content_video).permit(:title, :description, :url, :content_video_group_ids => [] )
  end

  def set_video
    @content_video = ContentVideo.find(params[:id])
  end
end
