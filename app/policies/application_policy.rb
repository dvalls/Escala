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


  def block_in_course?
    if user_is_admin?
     return true
    else
      condition = false
      user.courses.each do |course|
        if course.pages.find_by_id(record.page_id)
          condition = true
        end
      end
      return condition
    end
  end

  def video_in_course?
    if user_is_admin?
      return true
    else
      condition_page = false
      condition_course = false
      user.courses.each do |course|
        record.content_video_groups.each do |group|
          if user.courses.find_by_id(group.course_id)
            condition_course = true
          end
          group.content_blocks.each do |block|
            if course.pages.find_by_id(block.page_id)
            condition_page = true
            end
          end
        end
      end
      condition = condition_page and condition_course
      return condition
    end
  end


  def library_group_in_course?
    if user_is_admin?
      return true
    else
      condition_page = false
      condition_course = false
      if user.courses.find_by_id(record.course_id)
        condition_course = true
      end
      user.courses.each do |course|
        record.content_blocks.each do |block|
          if course.pages.find_by_id(block.page_id)
            condition_page = true
          end
        end
      end
      return (condition_page and condition_course)
    end


    end
end
