class ContentVideoGroupsController < ApplicationController
  before_action :admin_logged?
  before_action :get_group, only: [:edit, :update, :destroy]


  def index
    @video_groups = ContentVideoGroup.all
  end

  def new
    @group = ContentVideoGroup.new
  end

  def create
    @group = ContentVideoGroup.new(group_params)
    if @group.save
      redirect_to content_videos_path, notice: 'Grupo criado.'
    end
  end

  def edit
  end

  def update
  if @group.update(grou_params)
    redirect_to content_videos_path, notice: 'Grupo atualizado.'
  else
    render :edit
  end
  end

  def destroy
    @group.destroy

    redirect_to content_videos_path, notice: 'Grupo apagado.'
  end

  private

  def group_params
    params.require(:content_video_group).permit(:name, :course_id)
  end

  def get_group
    @group = ContentVideoGroup.find(params[:id])
  end
end
