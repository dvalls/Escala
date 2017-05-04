class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  before_filter :user_admin?, only: [:new, :create, :edit, :update]

  # before_filter :authorize

  def index
    @category = nil
    @categories = Category.all.sorted
    @library_groups = ContentLibraryGroup.all
  end

  def show
    # Find the category belonging to the given id
    @category = Category.find(params[:id])
    # Grab all sub-categories
    @categories = @category.subcategories
    # We want to reuse the index renderer:
    render :action => :index
  end


  def new
    @category = Category.new
    @categories = Category.where(parent_id: nil).map{|x| [x.name] + [x.id]}
    @subcategories = Category.where.not(parent_id: nil).map{|x| [x.name] + [x.id]}
  end

  def edit
    @categories = Category.where(parent_id: nil).map{|x| [x.name] + [x.id]}
    @subcategories = Category.where.not(parent_id: nil).map{|x| [x.name] + [x.id]}
  end

  def create
    @category = Category.new(category_params)

    set_parent_id

    if @category.save
      redirect_to categories_path, notice: t('views.category.create')
    else
      flash[:notice] = "#{@category.errors.full_messages}"
      render action: 'new'
    end
  end

   def update
     set_parent_id

     if @category.update(category_params)
      redirect_to categories_path, notice: t('views.category.updated')
    else
      flash[:notice] = "#{@category.errors.full_messages}"
      render action: 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: t('views.category.destroy')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :parent_id)
    end

  def set_parent_id
    # if not params[:sub_id] == ''
      # @category.parent_id = (params[:sub_id]).to_i
    # elsif not params[:raiz_id] == ''
      # @category.parent_id = (params[:raiz_id]).to_i
    # else
      @category.parent_id = nil
    # end
  end


end
