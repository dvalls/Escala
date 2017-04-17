class Member::LibraryFileController < Member::MemberAreaController #ApplicationController
  before_action :set_archive, only: [:show, :destroy]
  before_action :set_subcategories, only: [ :index]

  before_action :student_logged?

  def index
    # @library_files = LibraryFile.all
    @archives = LibraryFile.all.where(:course_id => params[:course_id])

    @categories = Category.all.includes(:subcategories).where('parent_id' => nil)
    case params[:subcategory]
      when nil
        @subcategory = []
      else
        @subcategory = Category.find(params[:subcategory])
    end
  end

  def show
  end

  def destroy
    @library_file.destroy
    redirect_to member_course_archives_path, notice: 'Material excluído com sucesso.'
  end

  private

  def assets_params
    params.require(:library_file).permit(:name, :category_id, :description)
  end

  def set_subcategories
    @subcategories = Category.all.includes(:subcategories).where.not('parent_id' => nil)
  end

  def set_archive
    @library_file = LibraryFile.find(params[:id])
  end

  def remove_file
    @library_file.update_attributes(:remove_file => true)
  end

end
