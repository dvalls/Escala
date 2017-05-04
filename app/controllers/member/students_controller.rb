class Member::StudentsController < Member::MemberAreaController #ApplicationController
  before_action :student_logged?

  def show
    # @course = Course.friendly.find(params[:id])
    @student = get_logged
  end

end
