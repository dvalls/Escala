class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  before_filter :user_admin?, only: [:new, :create, :edit, :update]

  # before_filter :authorize

  def index
    @category = nil
    @categories = Category.all.where(:parent_id => nil )
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
    @categories = Category.all.map{|x| [x.name] + [x.id]}
    # @category.parent = Category.find(params[:id]) unless params[:id].nil?
  end

  def edit
    @categories = Category.all.map{|x| [x.name] + [x.id]}
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: t('views.category.create')
    else
      render action: 'new'
    end
  end

   def update
    if @category.update(category_params)
      redirect_to categories_path, notice: t('views.category.updated')
    else
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
      params.require(:category).permit(:name, :group, :parent_id)
    end
end
