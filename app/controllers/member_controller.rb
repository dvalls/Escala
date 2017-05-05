class MemberController < ApplicationController
  before_filter :student_logged?
  layout 'member'

  def index
    case session[:admin]
      when true
        @courses = Course.all
      when false
        @student = Student.find(session[:user_id])
        @courses = @student.courses
    end
  end
end
