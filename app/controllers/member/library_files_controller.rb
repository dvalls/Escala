class Member::LibraryFileController < Member::MemberAreaController #ApplicationController
  before_action :set_archive, only: [:show]
  before_action :set_subcategories, only: [ :index]

  before_action :get_course_page, only: [:show]
  before_action :get_subcategory, only: [:show]

  before_action :student_logged?

  layout 'app/views/layouts/member'

  def show
    get_page_contents
  end

  private

  def set_subcategories
    @subcategories = Category.all.includes(:subcategories).where.not('parent_id' => nil)
  end

  def get_course_page
    @course = Course.friendly.find(params[:course_id])
    @pages = @course.pages
    @page = Page.find(params[:page_id])
  end

  def get_subcategory
    @subcategory = Category.find(params[:category_id])
  end

  def get_category_files
    @library_files = []
    case @subcategory.subcategories
      when blank?
        @library_files = @subcategory.library_files
      # else

    end
  end
end
