class MassiveUpController < ApplicationController
  def new
    @library_file = LibraryFile.new
  end

  def create
    #keys: nome do arquivo, valor[0]: url, valor[1]: imagem, thumb
    params_dictionary = {}
    error_library_files = Array.new()

    all_params = (params[:library_file][:url])

    # Loop throw images
    all_params.each do |url|
      extension = get_extension(url.original_filename)
      name = (url.original_filename[0..-5]).downcase

    #verifica se o dicionario possui chave com esse nome
      if not params_dictionary.include?(name)
        params_dictionary[name] = Array.new(2)
      end

      case extension
        when 'png', 'jpg', 'gif'
        params_dictionary[name][1] = url
        else
        params_dictionary[name][0] = url
      end
    end

    params_dictionary.each do |name, urls|
      # se certifica de que os valores da chave são pares
      if urls.count.even?
      #name = name
      #urls[0] = url de arquivos para download
      #urls[1] = url de arquivos para thumbnail
      @library_file = LibraryFile.find_or_create_by(name: name)

        @library_file.category_id = params[:library_file][:category_id]
        @library_file.description = params[:library_file][:description]
        @library_file.name = name
        @library_file.url = urls[0]

        if @library_file.save #se o arquivo salvar
          get_or_set_image
          @image.url = urls[1]
          @image.title = name
          if not @image.save # se a imagem nao salvar
            @library_file.destroy # para que nao fique nenhum arquivo sem url
          end
        end
      else
        # se os valores da chave não são pares, loop continua para proxima chave
        error_library_files << name
        next
      end
    end
      redirect_to library_files_path, notice: "Arquivos criados com sucesso: #{}. Arquivos não criados: #{error_library_files}"
  end

  def texture_new
    @library_file = LibraryFile.new
  end

  #Casos em que o mesmo arquivo de upload servira para o thumbnail
  def texture_create
    params[:library_file][:url].each do |url|
      name = (url.original_filename[0..-5]).downcase

      @library_file = LibraryFile.find_or_create_by(name: name)
      @library_file.category_id = params[:library_file][:category_id]
      @library_file.description = params[:library_file][:description]
      @library_file.name = (url.original_filename[0..-5]).downcase
      @library_file.url = url
      if @library_file.save
        get_or_set_image
        @image.url = url
        @image.title = (url.original_filename[0..-5]).downcase
        @image.description = params[:library_file][:description]
        @image.save
      end

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


  def get_or_set_image
    # caso o arquivo de biblioteca não tenha uma image associada
    if @library_file.image == nil
      @image = Image.new(imageable_id: @library_file.id, imageable_type: 'LibraryFile')
    else # Se tiver, a imagem sera substituida
      @image = @library_file.image
    end
  end

end
