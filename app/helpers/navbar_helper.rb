module NavbarHelper
  def selected_language_icon
    Rails.cache.fetch("selected_language_name/#{current_locale}", expires_in: 1.day) do
      image_tag "icons/#{current_locale}.svg", size: "23", class: "rounded-2", title: t("navbar.language")
    end
  end

  def next_locale
    I18n.locale == :ru ? :en : :ru
  end
end
