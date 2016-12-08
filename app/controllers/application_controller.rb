class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  around_filter :set_time_zone
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def set_locale
    I18n.locale = params[:locale]
    I18n.locale ||= current_user&.try(:locale)
    I18n.locale ||= extract_locale_from_accept_language_header
    I18n.locale ||= I18n.default_locale
  end

  def set_time_zone(&block)
    time_zone = params[:time_zone] || current_user.try(:time_zone) || 'Kyiv'
    Time.use_zone(time_zone, &block)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
