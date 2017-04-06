class Member::ArchivesImagesController < Member::MemberAreaController #ApplicationController

  def index
    @images = ArchivesImage.all
  end

  def new
    puts '============================ NEW ===================================='

    @image = ArchivesImage.new
  end

  def edit
  end

  def create
    # Loop throw images
    puts '============================ CREATE ===================================='
    params[:image][:url].each do |url|
      puts "============= PARAMS CREATE ======   #{url}   ============================  "

      @image = ArchivesImage.new(image_params)
      @image.url = url
      @image.title = url.original_filename[0..-5]

      @image.save
      puts "=========== ERRORS ======   #{@image.errors.full_messages} ================================================="
    end
    redirect_to my_course_archives_path, notice: t('views.image.create')
  end

  def destroy
    @image.destroy
    redirect_to :back, notice: t('views.image.destroy')
  end

  def update
    if @image.update(image_params)
      redirect_to my_course_archives_path, :action => :edit, notice: t('views.updated_ok')
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
