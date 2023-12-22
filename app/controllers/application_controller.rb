class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  delegate :locale, to: :current
  helper_method :current_locale
  before_action :set_locale

  rescue_from ActionPolicy::Unauthorized do |_e|
    redirect_to root_path
  end

  def current_locale
    Current.locale ||= if user_signed_in?
                         current_user.locale || I18n.default_locale
                       else
                         session[:locale] || I18n.default_locale
                       end
  end

  def set_locale
    return if current_locale == I18n.locale

    I18n.locale = current_locale
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end
end
