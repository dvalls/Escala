class MyCourse::VideosController < MyCourse::MyCourseAreaController # ApplicationController

  before_action :set_student, only: [:index, :show]

  def index
    @student = get_student
    @videos = Video.all
  end

  def show
    @student = get_student
  end


  private

  def set_student
    @student = get_student
  end
end
