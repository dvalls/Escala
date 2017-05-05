class LibraryFilesController < ApplicationController
  before_action :set_archive, only: [:edit, :update, :destroy]
  before_filter :user_admin?, only: [:new, :create, :edit, :update]

  def index
    @library_groups = ContentLibraryGroup.all
  end

  def show
    @library_files = LibraryFile.all.order(:category_id).order(:name)
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
    @image = @library_file.image
  end

  def update
    if @library_file.update(assets_params)
      redirect_to library_files_path, notice: 'Material criado com sucesso.'
    else
      flash[:notice] = "#{@library_file.errors.full_messages}"
      render action: 'edit'
    end
  end

  def destroy
    @library_file.destroy
    redirect_to :back, notice: 'Material excluído com sucesso.'# library_files_path(), notice: 'Material excluído com sucesso.'
  end

  private

  def assets_params
    params.require(:library_file).permit(:name, :category_id,  :description, :url)
  end

  def set_archive
    @library_file = LibraryFile.find(params[:id])
  end

end
