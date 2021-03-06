class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  protected

  helper_method :admin_logged?
  def admin_logged?
    session[:admin]
  end

  helper_method :user_admin?
  def user_admin?
    unless session[:admin]
      redirect_to root_path
    end
  end

  helper_method :student_logged?
  def student_logged?
    unless session[:user_id] or session[:admin]
      redirect_to login_path
    end
  end

  def get_logged
    @user = session[:user]
  end

  def current_user
    if session[:admin]
      User.find(session[:user_id])
    else
      Student.find(session[:user_id])
    end
  end

  def set_current_user
    if session[:user_id] != nil
      @user = current_user
    end
  end

  def user_not_authorized
    redirect_to access_logout_path, :flash =>  { info:'não autorizado...'}
  end

  def get_user_courses
    if admin_logged?
      Course.all
    else
      set_current_user
      @user.courses
    end
  end

end
