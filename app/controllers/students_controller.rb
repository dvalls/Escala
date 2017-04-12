class StudentsController < ApplicationController
  before_filter :user_admin?


  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
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
    @student.username = @student.email.split('@').first

    if @student.save
      redirect_to students_path, notice: t('views.student.create')
    else
      puts "=================================== #{@student.errors.full_messages}=================================="
      render action: 'new'
    end
  end


  def update
    # @student.username = @student.email.split('@').first

    if @student.update(student_params)
      @student.username = @student.email.split('@').first
      if @student.save

      redirect_to students_path, notice: t('views.updated_ok')
      end
    else
      puts "=================================== #{@student.errors.full_messages}=================================="
      render action: 'edit'
    end
  end


  def destroy
    @student.destroy
    redirect_to students_path, notice: t('views.student.destroy')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def student_params
    params.require(:student).permit(:name, :last_name, :password, :username, :email,
                                     :course_ids => [])
  end

  def get_my_courses
    @course = Course.find(params[:id])
  end

end
