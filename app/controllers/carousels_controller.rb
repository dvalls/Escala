class CarouselsController < ApplicationController
  before_action :set_carousel, only: [:edit, :update, :destroy]
  before_filter :admin_logged?, only: [:new, :create, :edit, :update]


  def index
    @carousels = Carousel.order(order: :asc)
  end

  def new
    @carousel = Carousel.new
    @courses = Course.all
  end

  def edit
    @courses = Course.all
  end

  def create
    @carousel = Carousel.new(carousel_params)

    if @carousel.save
      redirect_to action: 'index', notice: 'Carousel was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @carousel.update(carousel_params)
      redirect_to action: 'index', notice: 'Carousel was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @carousel.destroy
    redirect_to carousels_url, notice: 'Carousel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carousel
      @carousel = Carousel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def carousel_params
      params.require(:carousel).permit(:course_id, :title, :description, :image_url, :order)
    end
end
