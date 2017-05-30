class ContentBlockPolicy < ApplicationPolicy

  def show?
    block_in_course?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
