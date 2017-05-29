class ContentLibraryGroupPolicy < ApplicationPolicy

  def show?
    library_group_in_course?
  end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
