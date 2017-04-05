class ArchivesController < ApplicationController
  before_action :set_asset, only: [:edit, :update, :show, :destroy]
  before_action :set_subcategories, only: [:new, :create, :edit, :update, :index]

  # before_action :remove_file, only: [:destroy]

  def index
    puts '============================ INDEX ===================================='


    @archives = Archive.all
    @categories = Category.all.includes(:subcategories).where('parent_id' => nil)
    case params[:subcategory]
      when nil
        @subcategory = []
      else
        @subcategory = Category.find(params[:subcategory])
    end
  end
  def show
  end

  def new
    puts '============================ NEW ===================================='
    @archive = Archive.new()
  end

  def create
    @archive = Archive.new(assets_params)
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
      redirect_to archives_path, notice: 'Material criado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    puts '============================ DESTROY! ===================================='

    @archive.destroy

    redirect_to archives_url, notice: 'Material excluído com sucesso.'
  end

  private

  def assets_params
    params.require(:archive).permit(:name, :category_id, :format, :description, :url, :thumbnail)
  end

  def set_subcategories
    @subcategories = Category.all.includes(:subcategories).where.not('parent_id' => nil)
  end

  def set_asset
    @archive = Archive.find(params[:id])
  end

  def remove_file
    @archive.update_attributes(:remove_file => true)
  end

end
