class MassiveUpController < ApplicationController
  def new
    @archive = Archive.new
  end

  def create
    # Loop throw images
    puts '============================ CREATE ===================================='
    puts "============= PARAMS CREATE ======   #{params[:url]}   ============================  "
    params[:archive][:url].each do |url|
      extension = get_extension(url.original_filename)
      puts "============= PARAMS CREATE ====== EXTENSION  #{extension}   ============================  "
      case extension
        when '.skp'
          puts '============================== WHEN SKP! INICIO++++++++++++++++++++++++++++++++++++'
          puts '============================== WHEN SKP! NOVO ARCHIVE++++++++++++++++++++++++++++++++++++'
          @archive = Archive.new(archives_params)
          @archive.category_id = params[:archive][:category_id]
          @archive.course_id = params[:archive][:course_id]
          @archive.description = params[:archive][:description]
          @archive.name = url.original_filename[0..-5]
          puts "============= PARAMS CREATE ====== category_id  #{params[:archive][:category_id]}   ============================  "
          puts "============= PARAMS CREATE ====== course_id  #{params[:archive][:course_id]}   ============================  "
          puts "============= PARAMS CREATE ====== description  #{params[:archive][:description]}   ============================  "
          puts "============= PARAMS CREATE ====== url.original_filename[0..-5]  #{url.original_filename[0..-5]}   ============================  "
          puts "============= PARAMS CREATE ====== valid?  #{@archive.valid?}   ============================  "
          @archive.url  = url
          puts '============================== WHEN SKP! FINAL++++++++++++++++++++++++++++++++++++'
          @archive.save
            # redirect_to archives_path, :notice => "deu crepe #{@archive.errors.full_messages}"
        when '.png'
          puts '============================== WHEN PNG!+ INICIO+++++++++++++++++++++++++++++++++++'
          @archive = Archive.find_by_name(url.original_filename[0..-5])
          if @archive
            @image = @archive.images.new(image_params)
            @image.url = url
            @image.title = url.original_filename[0..-5]
            @image.description = params[:archive][:description]

            @image.save
              # puts "============= PARAMS CREATE ======   #{@image.errors.full_messages}   ============================  "

              # redirect_to archives_path, :notice => "deu crepe #{@image.errors.full_messages}"
          else
            puts '============================== WHEN PNG!+ ELSE +++++++++++++++++++++++++++++++++++'
            @archive = Archive.new(archives_params)
            @archive.category_id = params[:archive][:category_id]
            @archive.course_id = params[:archive][:course_id]
            @archive.description = params[:archive][:description]
            @archive.name = url.original_filename[0..-5]
            puts "============= PARAMS CREATE ====== category_id  #{params[:archive][:category_id]}   ============================  "
            puts "============= PARAMS CREATE ====== course_id  #{params[:archive][:course_id]}   ============================  "
            puts "============= PARAMS CREATE ====== description  #{params[:archive][:description]}   ============================  "
            puts "============= PARAMS CREATE ====== url.original_filename[0..-5]  #{url.original_filename[0..-5]}   ============================  "
            puts "============= PARAMS CREATE ====== EXTENSION  #{extension}   ============================  "
            @archive.url  = url


            if @archive.save
              @image = @archive.images.new(image_params)
              @image.url = url
              @image.title = url.original_filename[0..-5]
              @image.description = params[:archive][:description]

              @image.save
            end
            puts '============================== WHEN PNG!+ FINAL+++++++++++++++++++++++++++++++++++'
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
