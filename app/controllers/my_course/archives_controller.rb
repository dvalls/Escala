class MyCourse::ArchivesController < MyCourse::MyCourseAreaController #ApplicationController
  before_action :set_archive, only: [:show, :destroy]
  before_action :set_subcategories, only: [ :index]
  before_action :student_logged?


  # before_action :remove_file, only: [:destroy]


  def index
    puts '============================ INDEX ===================================='

    @archives = Archive.all
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
    puts '============================ DESTROY! ===================================='

    # @archive.update_attributes(:remove_file => true)
    @archive.destroy

    redirect_to my_course_archives_url, notice: 'Material excluído com sucesso.'
  end

  private

  def assets_params
    params.require(:archive).permit(:name, :category_id,  :description)
  end

  def set_subcategories
    @subcategories = Category.all.includes(:subcategories).where.not('parent_id' => nil)
  end

  def set_archive
    @archive = Archive.find(params[:id])
  end

  def remove_file
    @archive.update_attributes(:remove_file => true)
  end

end
