class MassiveUpController < ApplicationController
  def new
    @archive = Archive.new
  end

  def create
    # Loop throw images
    puts '============================ CREATE ===================================='
    params[:archive][:url].each do |url|
      extension = get_extension(url.original_filename)
      case extension
        when '.skp'
          puts '============================== WHEN SKP! INICIO++++++++++++++++++++++++++++++++++++'
          puts "============= PARAMS CREATE ====== url?  #{url}   ============================  "
          puts "============= PARAMS CREATE ====== url.url?  #{url.url}   ============================  "
          @archive = Archive.find_by_name(url.original_filename[0..-5])
          if @archive
            @archive.url = url
            @archive.save
          else
          @archive = Archive.new()
          @archive.category_id = params[:archive][:category_id]
          @archive.course_id = params[:archive][:course_id]
          @archive.description = params[:archive][:description]
          @archive.name = url.original_filename[0..-5]
          @archive.url = url
          puts '============================== WHEN SKP! FINAL++++++++++++++++++++++++++++++++++++'
          @archive.save
            # redirect_to archives_path, :notice => "deu crepe #{@archive.errors.full_messages}"
          end
        when '.png'
          puts '============================== WHEN PNG!+ INICIO+++++++++++++++++++++++++++++++++++'
          @archive = Archive.find_by_name(url.original_filename[0..-5])
          if @archive
            @image = @archive.images.new(image_params)
            @image.url = url
            @image.title = url.original_filename[0..-5]
            @image.description = params[:archive][:description]

            @image.save
          else
            puts '============================== WHEN PNG!+ ELSE +++++++++++++++++++++++++++++++++++'
            @archive = Archive.new(archives_params)
            @archive.category_id = params[:archive][:category_id]
            @archive.course_id = params[:archive][:course_id]
            @archive.description = params[:archive][:description]
            @archive.name = url.original_filename[0..-5]
            puts "============= PARAMS CREATE ====== archive valid?  #{@archive.valid?}   ============================  "

            @archive.save

            @image = Image.new
            @image.imageable_id = @archive.id
            @image.imageable_type = Archive
            @image.url = url
            @image.title = url.original_filename[0..-5]
            @image.description = params[:archive][:description]
            puts "============= PARAMS CREATE ====== url  #{@image.url}   ============================  "
            puts "============= PARAMS CREATE ====== title  #{@image.title}   ============================  "
            puts "============= PARAMS CREATE ====== description  #{@image.description}   ============================  "
            puts "============= PARAMS CREATE ====== valid?  #{@image.valid?}   ============================  "
            puts "============= PARAMS CREATE ====== errors?  #{@image.errors.full_messages}   ============================  "
            @image.save
            puts '============================== WHEN PNG!+ FINAL+++++++++++++++++++++++++++++++++++'
          end
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
