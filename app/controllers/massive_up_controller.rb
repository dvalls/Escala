class MassiveUpController < ApplicationController
  def new
    @library_file = LibraryFile.new
  end

  def create
    # Loop throw images
    params[:library_file][:url].each do |url|
      extension = get_extension(url.original_filename)
      get_set_archive(url)

      case extension
        when '.skp'
          @library_file.url = url
          @library_file.save
        when '.png'
          get_set_image
          @image.url = url
          @image.title = url.original_filename[0..-5]
          @image.description = params[:library_file][:description]

          @image.save
      end
    end
    redirect_to library_files_path, notice: t('views.image.create')
  end


  private

  def image_params
    params.permit(:url, :imageable_id, :imageable_type, :title, :description)
  end

  def archives_params
    params.require(:library_file).permit(:name, :category_id, :description, :url)
  end

  def get_extension(filename)
    size = filename.length
    final_size = size - 4
    return  filename[final_size..size]
  end

  def get_set_archive(url)
    @library_file = LibraryFile.find_by_name(url.original_filename[0..-5])
    if not @library_file
      @library_file = LibraryFile.new()
      @library_file.category_id = params[:library_file][:category_id]
      @library_file.description = params[:library_file][:description]
      @library_file.name = url.original_filename[0..-5]
      @library_file.save
    end
  end

  def get_set_image
    if @library_file.image == nil
      @image = Image.new(imageable_id: @library_file.id, imageable_type: 'LibraryFile')
      # @image = @library_file.image.new(image_params)
    else
      @image = @library_file.image
    end
  end

end
