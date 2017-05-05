class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale


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
    session[:user]
  end

end
