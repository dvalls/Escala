class MyCourse::StudentsController < MyCourse::MyCourseAreaController #ApplicationController
  before_action :student_logged?

  before_action :set_student, only: [:show, :edit, :update, :destroy]
  # before_action :get_my_courses, only: [:my_course]


  def index
    @student = get_student
  end


  def show
    @course = Course.friendly.find(params[:id])

  end

  def content
    @course = Course.friendly.find(params[:id])
  end


  def new
    @student = Student.new
  end


  def edit
  end


  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to course_images_path(@course), notice: t('views.course.create')
    else
      render action: 'new'
    end
  end


  def update
    if @student.update(student_params)
      redirect_to @student, notice: t('views.updated_ok')
    else
      render action: 'edit'
    end
  end


  def destroy
    @student.destroy
    redirect_to courses_url, notice: t('views.course.destroy')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def student_params
    params.require(:student).permit(:name, :last_name, :password, :username, :email, :gender, :degree,
                                    :address, :address_number, :birthday)
  end

  def get_my_courses
    @course = Course.find(params[:id])
  end

end
