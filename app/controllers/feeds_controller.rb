class FeedsController < ApplicationController
  before_filter :user_admin?, only: [:new, :create, :edit, :update]

  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all
  end


  def show
  end


  def new
    @feed = Feed.new
  end


  def edit
  end


  def create
    @feed = Feed.new(feed_params)

    if @feed.save
      redirect_to @feed, notice: t('views.feed.create')
    else
      render action: 'new'
    end
  end


  def update
    if @feed.update(feed_params)
      redirect_to @feed, notice: t('views.feed.updated')
    else
      render action: 'edit'
    end
  end


  def destroy
    @feed.destroy
    redirect_to feeds_url, notice: t('views.feed.destroy')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feed_params
      params.require(:feed).permit(:title, :body, :image)
    end
end
