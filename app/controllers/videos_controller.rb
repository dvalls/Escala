class VideosController < ApplicationController
  before_filter :user_admin?
  before_action :set_video, only: [:edit, :update, :destroy]

  def index
    @videos = Video.order(title: :asc)
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

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to videos_path
    else
      flash[:notice] = 'verificar as cagadas'
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path, warning: 'Video excluído'
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :url, :course_id, :category_id)
  end

  def set_video
    @video = Video.find(params[:id])
  end
end
