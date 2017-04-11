class MassiveUpController < ApplicationController
  def new
    @archive = Archive.new
  end

  def create
    # Loop throw images
    puts '============================ CREATE ===================================='
    puts "============= PARAMS CREATE ======   #{params[:url]}   ============================  "
    params[:archive][:url].each do |url|
      puts "============= PARAMS CREATE ======   #{url}   ============================  "
      extension = get_extension(url.original_filename)
      case extension
        when '.skp'
          @archive = Archive.new(archives_params)
          @archive.category_id = params[:category_id]
          @archive.course_id = params[:course_id]
          @archive.description = params[:description]
          @archive.name = url.original_filename[0..-5]
          @archive.url  = url

          if @archive.save
          else
            redirect_to archives_path, :notice => "deu crepe #{@archive.errors.full_messages}"
          end
        when '.png'
          @archive = Archive.find_by_name(url.original_filename[0..-5])
          if @archive
            @image = @archive.images.new(image_params)
            @image.url = url
            @image.title = url.original_filename[0..-5]

            if @image.save
            else
              redirect_to archives_path, :notice => "deu crepe #{@image.errors.full_messages}"
            end
          else

            @archive = Archive.new(archives_params)
            @archive.category_id = params[:category_id]
            @archive.course_id = params[:course_id]
            @archive.description = params[:description]
            @archive.name = url.original_filename[0..-5]
            @archive.url  = url

            if @archive.save
              @image = @archive.images.new(image_params)
              @image.url = url
              @image.title = url.original_filename[0..-5]

              @image.save
            else
              redirect_to archives_path, :notice => "deu crepe #{@archive.errors.full_messages}"
            end
          end
      end
    end
    redirect_to archives_path, notice: t('views.image.create')
  end


  private

  def image_params
    params.require(:image).permit(:url, :imageable_id, :imageable_type, :title, :description)
  end

  def archives_params
    params.require(:archive).permit(:name, :category_id, :description, :course_id, :url)
  end

  def get_extension(filename)
    size = filename.length
    final_size = size - 4
    return  filename[final_size..size]

  end

  # def massive_new
  #
  # end
  #
  # def massive_create
  #   # Loop throw images
  #   puts '============================ CREATE ===================================='
  #   params[:image][:url].each do |url|
  #     puts "============= PARAMS CREATE ======   #{url}   ============================  "
  #     if @imageable.name == url.original_filename[0..-5]
  #       @image = @imageable.images.new(image_params)
  #       @image.url = url
  #       @image.title = url.original_filename[0..-5]
  #
  #       @image.save
  #
  #       puts "=========== ERRORS ======   #{@image.errors.full_messages} ================================================="
  #     end
  #
  #   end
  #   redirect_to edit_polymorphic_path([@image.imageable]), notice: t('views.image.create')
  # end
end
