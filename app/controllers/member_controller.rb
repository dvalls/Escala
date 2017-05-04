class MemberController < ApplicationController
  before_filter :student_logged?
  layout 'member'

  def index
    @student = get_student
    case session[:admin]
      when true
        @courses = Course.all
      when false
        @courses = get_student.courses
    end
  end
end
