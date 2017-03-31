class AboutsController < ApplicationController

  before_action :set_about, only: [:show, :edit, :update]
  before_filter :authorize, :except => [:show]

  def show
  end


  def edit
  end

  def update
    if @about.update(about_params)
      redirect_to about_path, notice: t('views.updated_ok')
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_about
    @about = About.first_or_create!

    # load images
    @images = @about.images
  end

  # Only allow a trusted parameter "white list" through.
  def about_params
    params.require(:about).permit(:body)
  end

end
