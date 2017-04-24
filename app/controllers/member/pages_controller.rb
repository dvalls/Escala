class Member::PagesController < Member::MemberAreaController #ApplicationController
  before_action :student_logged?

  def show
    @course = Course.friendly.find(params[:course_id])
    @pages = @course.pages
    @page = Page.find(params[:id])
    @blocks = @page.content_blocks.order(:order)
    get_page_contents
    case
      when params[:category].present?
        @selected_category = Category.find(params[:category])
      else
        @selected_category = @page_categories.first
    end
  end

end
