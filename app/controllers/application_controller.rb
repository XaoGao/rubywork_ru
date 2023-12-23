class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_locale
  helper_method :current_locale

  rescue_from ActionPolicy::Unauthorized do |_e|
    redirect_to root_path
  end

  def set_current_locale
    Current.locale = extract_locale_from_user || extract_locale_from_session || I18n.default_locale
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end

  def current_locale
    Current.locale
  end

  def extract_locale_from_user
    current_user&.locale if defined?(current_user) && current_user&.locale
  end

  def extract_locale_from_session
    session[:locale]
  end
end
