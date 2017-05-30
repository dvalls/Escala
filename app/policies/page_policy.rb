class PagePolicy < ApplicationPolicy

  def show?
    page_in_course?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
