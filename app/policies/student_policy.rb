class StudentPolicy < ApplicationPolicy

  def edit?
    user.id == record.id
  end

  def show?
    page_in_course?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
