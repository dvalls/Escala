class ApplicationPolicy
  attr_reader :user, :record

  include ApplicationHelper

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end

  def user_has_course?
    if user_is_admin?
      true
    else
      user.courses.find_by_id(record.id)
    end
  end

  def page_in_course?
    if user_is_admin?
      true
    else
      user.courses.find_by_id(record.course.id)
    end
  end
end
