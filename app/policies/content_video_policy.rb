class ContentVideoPolicy < ApplicationPolicy

  def show?
    video_in_course?
  end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
