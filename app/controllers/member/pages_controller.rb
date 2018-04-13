class Member::PagesController < Member::MemberAreaController #ApplicationController
  before_action :student_logged?

  def show
    @course = Course.friendly.find(params[:course_id])

    authorize @course
    @pages = @course.pages.order(:name)

    @page = Page.find(params[:id])

    authorize @page
    @blocks = @page.content_blocks.order(:order)
    get_page_contents #definido no MemberAreaController
  end

end
