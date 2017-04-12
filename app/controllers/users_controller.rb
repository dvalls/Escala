class UsersController < ApplicationController
  before_filter :user_admin?

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, flash: { success:  t('flash.success')}
    else
      puts "'#{ @user.errors.full_messages}'"

      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :admin)
  end
end
