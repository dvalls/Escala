class LibraryFilesController < ApplicationController
  before_action :set_archive, only: [:edit, :update, :show, :destroy]
  before_action :set_subcategories, only: [:new, :create, :edit, :update, :index]
  before_filter :user_admin?, only: [:new, :create, :edit, :update]

  def index
    @categories = Category.where('parent_id' => nil)
    @library_files = LibraryFile.all
    @library_groups = ContentLibraryGroup.all

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
    @library_file = LibraryFile.new()
  end

  def create
    params[:library_file][:url]
      @library_file = LibraryFile.new(assets_params)
      @library_file.url = params[:library_file][:url]
      @library_file.name = (params[:library_file][:url]).original_filename[0..-5]
    if @library_file.save
      redirect_to edit_library_file_path(@library_file), notice: 'Material criado com sucesso'
    else
      flash[:notice] = "#{@library_file.errors.full_messages}"
      render action: 'new'
    end
  end

  def edit
    @images = @library_file.images
  end

  def update
    if @library_file.update(assets_params)
      redirect_to library_files_path(:subcategory => @library_file.category), notice: 'Material criado com sucesso.'
    else
      flash[:notice] = "#{@library_file.errors.full_messages}"
      render action: 'edit'
    end
  end

  def destroy
    category = @library_file.category
    @library_file.destroy
    redirect_to library_files_path(:subcategory => category), notice: 'Material excluído com sucesso.'
  end

  private

  def assets_params
    params.require(:library_file).permit(:name, :category_id,  :description, :page_id, :url)
  end

  def set_subcategories
    @subcategories = Category.all.where.not('parent_id' => nil)
  end

  def set_archive
    @library_file = LibraryFile.find(params[:id])
  end

  def remove_file
    @library_file.update_attributes(:remove_file => true)
  end

end
