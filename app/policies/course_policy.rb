class CoursePolicy < ApplicationPolicy

  def show?
    user_has_course?
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
