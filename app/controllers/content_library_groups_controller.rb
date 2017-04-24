class ContentLibraryGroupsController < ApplicationController
  before_action :admin_logged?
  before_action :get_group, only: [:edit, :update, :destroy]

  def index
    @library_groups = ContentLibraryGroup.all
  end

  def new
    @group = ContentLibraryGroup.new
    @categories = Category.all.where(parent_id: nil)
  end

  def create
    @group = ContentLibraryGroup.new(group_params)
    if @group.save
      redirect_to categories_path, notice: 'Grupo criado.'
    end
  end

  def edit
    @categories = Category.all.where(parent_id: nil)
  end

  def update
    if @group.update(group_params)
      redirect_to categories_path, notice: 'Grupo atualizado.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy

    redirect_to categories_path, notice: 'Grupo apagado.'
  end

  private

  def group_params
    params.require(:content_library_group).permit(:name, :course_id, :category_ids => [])
  end

  def get_group
    @group = ContentLibraryGroup.find(params[:id])
  end
end
