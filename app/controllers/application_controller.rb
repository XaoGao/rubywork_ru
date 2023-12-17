class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from ActionPolicy::Unauthorized do |_e|
    redirect_to root_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end

  def set_locale
    return if locale == I18n.locale

    I18n.locale = locale
  end

  def locale
    @locale ||= if user_signed_in? 
                  current_user.locale || I18n.default_locale
                else
                  session[:locale] || I18n.default_locale
                end
  end
end
