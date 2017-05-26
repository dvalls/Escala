class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_filter :user_admin?, only: [:new, :create, :edit, :update]


  def index
    @courses = Course.all
    @categories = Category.all
  end


  def show
  end


  def new
    @course = Course.new
  end


  def edit
    @images = @course.images
  end


  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_path,  notice: t('views.course.create')
    else
      render action: 'new'
    end
  end


  def update
    if @course.update(course_params)
      redirect_to @course, notice: t('views.updated_ok')
    else
      render action: 'edit'
    end
  end


  def destroy
    @course.destroy
    redirect_to courses_url, notice: t('views.course.destroy')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.friendly.find(params[:id])

      #where("year <= ? and publish = ? and id != ?", @course.year, true, @course.id)
      @course_previous = Course.where("id <= ? and id != ?", @course.id,  @course.id).where(publish: true).order(id: :desc).first
      @course_next = Course.where("id > ? and id != ?", @course.id,  @course.id).where(publish: true).order(:id).first
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:title, :description, :body, :year, :slug, :cover_image, :publish)
    end

end
