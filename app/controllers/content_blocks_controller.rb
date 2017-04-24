class ContentBlocksController < ApplicationController
  before_action :get_block, only: [:edit, :update, :destroy]
  before_action :set_content_type_and_id, only: [:create]
  before_action :set_page, only: [:new, :create]
  before_action :admin_logged?

  def index
    @blocks = ContentBlock.all
    @library_groups = ContentLibraryGroup.all
    @video_groups = ContentVideoGroup.all
  end

  def new
    @block = ContentBlock.new
    @video_contents = ContentVideoGroup.all.where(:course_id => @page.course_id)
    @library_contents = ContentLibraryGroup.all.where(:course_id => @page.course_id)
    @docs_contents = ContentDocsGroup.all.where(:course_id => @page.course_id)
  end

  def create
    @block = ContentBlock.new(block_params)
    @block.page_id = @page.id
    @block.contentable_type = @contentable.class.name
    @block.contentable_id = @contentable.id

    if @block.save
      redirect_to pages_path, notice: 'Bloco criado.'
    else
      render :new
    end
  end

  def edit
  end


  def update
    if @block.update(block_params)
      redirect_to pages_path, notice: 'Bloco atualizado.'
    else
      render :edit
    end
  end

  def destroy
    @block.destroy
    redirect_to pages_path, notice: 'Bloco exlcuido.'
  end

  private

  def block_params
    params.require(:content_block).permit(:order, :page_id, :contentable_id, :contentable_type)
  end

  def get_block
    @block = ContentBlock.find(params[:id])
  end

  def set_page
    @page = Page.find(params[:page_id])
  end


  def set_contentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @contentable = $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def set_content_type_and_id
    case
      when params[:video_content].present?
        @contentable = ContentVideoGroup.find(params[:video_content])
      when params[:library_content].present?
        @contentable = ContentLibraryGroup.find(params[:library_content])
      when params[:docs_content].present?
        @contentable = ContentDocsGroup.find(params[:docs_content])
    end
  end
end
