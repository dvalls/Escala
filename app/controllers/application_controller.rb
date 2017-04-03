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

  # def authorize
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV['USER_ID'] && password == ENV['PASSWORD']
  #   end
  #
  # end
  #
  # def signed_in?
  #   not request.authorization.nil?
  # end

  helper_method :student_logged?
  def student_logged?
    session[:user_id]
  end

  def get_student
    Student.find(session[:user_id])
  end

  helper_method :has_course?
  def has_course?
    get_student.courses.find_by_title(@course.title)
  end
end
