class ArchivesController < ApplicationController
  before_action :set_archive, only: [:edit, :update, :show, :destroy]
  before_action :set_subcategories, only: [:new, :create, :edit, :update, :index]
  before_filter :user_admin?, only: [:new, :create, :edit, :update]


  # before_action :remove_file, only: [:destroy]


  def index
    puts '============================ INDEX ===================================='
    @categories = Category.all.includes(:subcategories).where('parent_id' => nil)

    case params[:subcategory]
      when nil
        @subcategory = []
      else
        @subcategory = Category.find(params[:subcategory])
        @archives = @subcategory.archives.order(name: :asc)
    end
  end

  def show
  end

  def new
    @archive = Archive.new()
  end

  def create
    @archive = Archive.new(assets_params)
    # @archive.name = (params[:url]).original_filename[0..-5]
    if @archive.save
      redirect_to archives_path(:subcategory => @archive.category), notice: 'Material criado com sucesso'
    else
      render action: 'new'
    end
  end

  def edit
    @images = @archive.images
  end

  def update
    if @archive.update(assets_params)
      redirect_to archives_path(:subcategory => @archive.category), notice: 'Material criado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    category = @archive.category
    @archive.destroy
    redirect_to archives_path(:subcategory => category), notice: 'Material excluído com sucesso.'
  end

  private

  def assets_params
    params.require(:archive).permit(:name, :category_id,  :description, :course_id, :url)
  end

  def set_subcategories
    @subcategories = Category.all.where.not('parent_id' => nil)
  end

  def set_archive
    @archive = Archive.find(params[:id])
  end

  def remove_file
    @archive.update_attributes(:remove_file => true)
  end

end
