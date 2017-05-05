class MassiveUpController < ApplicationController
  def new
    @library_file = LibraryFile.new
  end

  def create
    # Loop throw images
    all_params = (params[:library_file][:url]).reverse
    # params[:library_file][:url].each do |url|
    all_params.each do |url|
      extension = get_extension(url.original_filename)
      get_set_library_file(url)

      case extension
        when 'skp', 'hdr', 'ies', 'zip'
          @library_file.url = url
          @library_file.save
        when 'png', 'jpg', 'gif'
          get_set_image
          @image.url = url
          @image.title = (url.original_filename[0..-5]).downcase
          @image.description = params[:library_file][:description]

          @image.save
      end
    end
    flash[:notice] = "#{@library_file.errors.full_messages}// #{@image.errors.full_messages}"
    redirect_to library_files_path, notice: t('views.image.create')
  end

  def texture_new
    @library_file = LibraryFile.new
  end

  #Casos em que o mesmo arquivo de upload servira para o thumbnail
  def texture_create
    params[:library_file][:url].each do |url|

      find_archive(url)
      @library_file.category_id = params[:library_file][:category_id]
      @library_file.description = params[:library_file][:description]
      @library_file.name = (url.original_filename[0..-5]).downcase
      @library_file.url = url
      @library_file.save

      @image = Image.new(imageable_id: @library_file.id, imageable_type: 'LibraryFile')
      @image.url = url
      @image.title = (url.original_filename[0..-5]).downcase
      @image.description = params[:library_file][:description]
      @image.save
    end
    flash.now[:notice] = "#{@library_file.errors.full_messages}// #{@image.errors.full_messages}"

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
    array = filename.split('.')
    puts array[1]

    return  array[1]
  end

  def find_archive(url)
    name = (url.original_filename[0..-5]).downcase
    @library_file = LibraryFile.find_by_name(name)
    if not @library_file
      @library_file = LibraryFile.new()
    end
  end

  def get_set_library_file(url)
    name = (url.original_filename[0..-5]).downcase
    #Procura um arquivo de biblioteca existente a partir do nome do arquivo
    @library_file = LibraryFile.find_by_name(name)
    # Caso não encontre um arquivo de biblioteca existente
    if not @library_file
      @library_file = LibraryFile.new()
      @library_file.category_id = params[:library_file][:category_id]
      @library_file.description = params[:library_file][:description]
      @library_file.name = name
      @library_file.url = url
      @library_file.save
    end
  end

  def get_set_image
    # caso o arquivo de biblioteca não tenha uma image associada
    if @library_file.image == nil
      @image = Image.new(imageable_id: @library_file.id, imageable_type: 'LibraryFile')
      # @image = @library_file.image.new(image_params)
    else # Se tiver, a imagem sera substituida
      @image = @library_file.image
    end
  end

end
