class MyCourse::VideosController < MyCourse::MyCourseAreaController # ApplicationController

  before_action :set_student, only: [:index, :show]
  before_action :student_logged?

  def index
    @student = get_student
    @videos = Video.all.where( :course_id => params[:course_id])
  end

  def show
    @student = get_student
  end


  private

  def set_student
    @student = get_student
  end
end
