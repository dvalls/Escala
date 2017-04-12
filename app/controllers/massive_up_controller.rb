class MassiveUpController < ApplicationController
  def new
    @archive = Archive.new
  end

  def create
    # Loop throw images
    params[:archive][:url].each do |url|
      extension = get_extension(url.original_filename)
      get_set_archive(url)

      case extension
        when '.skp'
          @archive.url = url
          @archive.save
        when '.png'
          @image = @archive.images.new(image_params)
          @image.url = url
          @image.title = url.original_filename[0..-5]
          @image.description = params[:archive][:description]

          @image.save
      end
    end
    redirect_to archives_path, notice: t('views.image.create')
  end


  private

  def image_params
    params.permit(:url, :imageable_id, :imageable_type, :title, :description)
  end

  def archives_params
    params.require(:archive).permit(:name, :category_id, :description, :course_id, :url)
  end

  def get_extension(filename)
    size = filename.length
    final_size = size - 4
    return  filename[final_size..size]

  end

  def get_set_archive(url)
    @archive = Archive.find_by_name(url.original_filename[0..-5])
    if not @archive
      @archive = Archive.new()
      @archive.category_id = params[:archive][:category_id]
      @archive.course_id = params[:archive][:course_id]
      @archive.description = params[:archive][:description]
      @archive.name = url.original_filename[0..-5]
      @archive.save
    end
  end
end
