class PagesController < ApplicationController
  before_filter :user_admin?
  before_action :get_page, only: [:edit, :update, :destroy, :show]

  def index
    @blocks = ContentBlock.all #view parcial
    @video_groups = ContentVideoGroup.all#view parcial
    @library_groups = ContentLibraryGroup.all#view parcial
    @docs_groups = ContentDocsGroup.all#view parcial
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      ContentBlock.create(:page_id => @page.id)
      redirect_to pages_path, notice: 'Pagina criada com sucesso'
    else
      flash[:notice] = "#{@page.errors.full_messages}"
      render :new
    end
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to pages_path, notice: 'Pagina atualizada com sucesso'
    else
      flash[:notice] = "#{@page.errors.full_messages}"
      render :new
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_path, warning: 'Pagina excluida com sucesso'
  end

  private
  def page_params
    params.require(:page).permit(:name, :course_id, :content_block_id)
  end

  def get_page
    @page = Page.find(params[:id])
  end

end
