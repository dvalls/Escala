class Member::CategoriesController <  Member::MemberAreaController # ApplicationController
  before_action :student_logged?


  def index
    @category = nil
    @categories = Category.all.sorted
    @library_groups = ContentLibraryGroup.all
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
    @content_block = ContentBlock.find(params[:content_block_id])
    @content_library_group = ContentLibraryGroup.find(params[:content_library_group_id])
    @course = Course.find(@content_library_group.course_id)
    @pages = @course.pages
  end

  private
end
