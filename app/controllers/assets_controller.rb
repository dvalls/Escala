class AssetsController < ApplicationController
  before_action :set_asset, only: [:edit, :update, :show, :destroy]
  before_action :set_subcategories, only: [:new, :create, :edit, :update, :index]

  before_action :remove_file, only: [:destroy]

  def index
    puts '============================ INDEX ===================================='


    @assets = Asset.all
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

  def new
    puts '============================ NEW ===================================='
    @asset = Asset.new()
  end

  def create
    @asset = Asset.new(assets_params)
    if @asset.save
      redirect_to assets_path notice: 'Material criado com sucesso'
    else
      render action: 'new'
    end
  end

  def edit
    @images = @asset.images
  end

  def update
    if @asset.update(assets_params)
      redirect_to assets_url, notice: 'Material criado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    puts '============================ DESTROY! ===================================='

    @asset.destroy

    redirect_to assets_url, notice: 'Material excluído com sucesso.'
  end

  private

  def assets_params
    params.require(:asset).permit(:name, :category_id, :format, :description, :url, :thumbnail)
  end

  def set_subcategories
    @subcategories = Category.all.includes(:subcategories).where.not('parent_id' => nil)
  end

  def set_asset
    @asset = Asset.find(params[:id])
  end

  def remove_file
    @asset.update_attributes(:remove_file => true)
  end

end
