class StudentsController < ApplicationController
  before_filter :user_admin?

  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all.order(:username)
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
    @student.username = @student.email.strip
    @student.password = @student.name.downcase.strip

    if @student.save
      redirect_to students_path, notice: t('views.student.create')
    else
      flash[:notice] = @student.errors.full_messages
      render action: 'new'
    end
  end


  def update

    if @student.update(student_params)
      @student.password = params[:password]
      redirect_to students_path, notice: t('views.updated_ok')
    else
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

end
