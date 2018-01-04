class Member::StudentsController < Member::MemberAreaController #ApplicationController

  before_action :set_student, only: [:edit, :update]

  def edit
  end

  def update

    if @student.update(student_params)
      @student.password = params[:password]
      redirect_to member_path, notice: t('views.updated_ok')
    else
      render action: 'edit'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = @user
  end

  # Only allow a trusted parameter "white list" through.
  def student_params
    params.require(:student).permit(:name, :last_name, :password, :username, :email)
  end

end
