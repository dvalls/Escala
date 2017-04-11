class ArchivesController < ApplicationController
  before_action :set_archive, only: [:edit, :update, :show, :destroy]
  before_action :set_subcategories, only: [:new, :create, :edit, :update, :index]
  before_filter :user_admin?, only: [:new, :create, :edit, :update]


  # before_action :remove_file, only: [:destroy]


  def index
    puts '============================ INDEX ===================================='
    @archives = Archive.all
    @categories = Category.all.includes(:subcategories).where('parent_id' => nil)

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
    puts '============================ NEW ===================================='
    @archive = Archive.new()
  end

  def create
    # @archive = Archive.new(assets_params)
    # # @archive.name = (params[:url]).original_filename[0..-5]
    # if @archive.save
    #   redirect_to archives_path(:subcategory => @archive.category), notice: 'Material criado com sucesso'
    # else
    #   render action: 'new'
    # end



    # Loop throw images
    puts '============================ CREATE ===================================='
    params[:image][:url].each do |url|
      puts "============= PARAMS CREATE ======   #{url}   ============================  "
      case url.extension
        when 'skp'
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

        when 'png'
          @archive = Archive.fin_by_name(url.original_filename[0..-5])
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

  def edit
    @images = @archive.images
  end

  def update
    puts '============================ UPDATE! ===================================='
    if @archive.update(assets_params)
      redirect_to archives_path(:subcategory => @archive.category), notice: 'Material criado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    puts '============================ DESTROY! ===================================='

    # @archive.update_attributes(:remove_file => true)
    @archive.destroy

    redirect_to archives_path, notice: 'Material excluído com sucesso.'
  end

  private

  def assets_params
    params.require(:archive).permit(:name, :category_id,  :description, :course_id, :cover_image)
  end

  def set_subcategories
    @subcategories = Category.all.where.not('parent_id' => nil) #.where('subcategories_count = ?', 0)
  end

  def set_archive
    @archive = Archive.find(params[:id])
  end

  def remove_file
    @archive.update_attributes(:remove_file => true)
  end

end
