class ContentLibraryGroupsController < ApplicationController
  before_action :admin_logged?
  before_action :get_group, only: [:edit, :update, :destroy]

  def index
    @library_groups = ContentLibraryGroup.all
  end

  def show
    @content_group = ContentLibraryGroup.find(params[:id])
    #Ao entrar no show dos arquivos de biblioteca
    case params[:category_id]
      when nil #no primeiro acesso parametro sera nil e mostrará os arquivos da primeira categoria do grupo
        @library_files = (@content_group.categories.first).library_files.order(:name)

      else #Ao ir escolhendo categorias na view#show, o parametro altera seu valor para mostrar arqvuiso de outras categorias
        @library_files = Category.find(params[:category_id]).library_files
    end

  end

  def new
    @group = ContentLibraryGroup.new
    @categories = Category.all.where(parent_id: nil)
  end

  def create
    @group = ContentLibraryGroup.new(group_params)
    if @group.save
      redirect_to categories_path, notice: 'Grupo criado.'
    else
      flash[:notice] = "#{@group.errors.full_messages}"
      render :new
    end
  end

  def edit
    @categories = Category.all.where(parent_id: nil)
  end

  def update
    if @group.update(group_params)
      redirect_to categories_path, notice: 'Grupo atualizado.'
    else
      flash[:notice] = "#{@group.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to categories_path, notice: 'Grupo apagado.'
  end

  private

  def group_params
    params.require(:content_library_group).permit(:name, :course_id, :category_ids => [])
  end

  def get_group
    @group = ContentLibraryGroup.find(params[:id])
  end
end
