class MemberController < ApplicationController
  before_filter :student_logged?
  layout 'member'

  def index
    @student = Student.find(session[:user_id])
    case session[:admin]
      when true
        @courses = Course.all
      when false
        @courses = @student.courses
    end
  end
end
