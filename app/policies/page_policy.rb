class PagePolicy < ApplicationPolicy

  def show?

  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
