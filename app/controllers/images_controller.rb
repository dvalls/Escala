class ImagesController < ApplicationController
  before_filter :user_admin?

  before_action :set_imageable, only: [:index, :edit,  :create, :new, :update, :destroy]
  before_action :set_image, only: [:edit, :update, :destroy]

  def index
    @images = @imageable.images
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    # Loop throw images
    params[:image][:url].each do |url|
      @image = @imageable.images.new(image_params)
      @image.url = url
      @image.title = url.original_filename[0..-5]
      @image.save
    end
    redirect_to edit_polymorphic_path([@image.imageable]), notice: t('views.image.create')
  end

  def destroy
    @image.destroy
    redirect_to :back, notice: t('views.image.destroy')
  end

  def update
    if @image.update(image_params)
      redirect_to polymorphic_path([@image.imageable]), :action => :edit, notice: t('views.updated_ok')
    else
      render action: 'edit'
    end
  end


  private

  ## Only allow a trusted parameter "white list" through.
  def image_params
    params.require(:image).permit(:url, :imageable_id, :imageable_type, :title, :description)
  end

  def set_image
    @image = Image.find(params[:id])
  end

  def set_imageable
    params.each do |name, value|
      # With ID
      if name =~ /(.+)_id$/
        if $1 == 'course'
          @imageable =  $1.classify.constantize.friendly.find(value) # Exclusive loading 'cause FriendlyId...
        else
          @imageable =  $1.classify.constantize.find(value)
        end

      #For single resource
      else
        resource, id = request.path.split('/')[1,2]
        @imageable = resource.classify.constantize.first
      end
    end
    nil
  end
end
