class ArchivesImagesController < ApplicationController
  before_filter :user_admin?, only: [:new, :create, :edit, :update]


  def index
    @images = ArchivesImage.all
  end

  def new
    @image = ArchivesImage.new
  end

  def edit
  end

  def create
    # Loop throw images
    params[:image][:url].each do |url|
      @image = ArchivesImage.new(image_params)
      @image.url = url
      @image.title = url.original_filename[0..-5]
      @image.save
    end
    redirect_to archives_path, notice: t('views.image.create')
  end

  def destroy
    @image.destroy
    redirect_to :back, notice: t('views.image.destroy')
  end

  def update
    if @image.update(image_params)
      redirect_to archives_path, :action => :edit, notice: t('views.updated_ok')
    else
      render action: 'edit'
    end
  end


  private

  ## Only allow a trusted parameter "white list" through.
  def image_params
    params.require(:archives_image).permit(:url, :archive_id, :title, :description)
  end

  def set_image
    @image = Image.find(params[:id])
  end

end
