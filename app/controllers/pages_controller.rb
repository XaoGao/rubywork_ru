class PagesController < ApplicationController
  def welcome; end

  def switch_locale
    params_locale = params[:locale].to_sym
    locale = I18n.available_locales.include?(params_locale) ? params_locale : default_locale
    I18n.locale = locale
    store_locale

    redirect_back(fallback_location: root_path)
  end

  private

  def default_locale
    @default_locale ||= current_user&.locale || I18n.default_locale
  end

  def store_locale
    if user_signed_in?
      current_user.update(locale: I18n.locale)
    else
      session[:locale] = I18n.locale
    end
  end
end
