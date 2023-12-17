module NavbarHelper
  def selected_language_name
    Rails.cache.fetch("selected_language_name/#{I18n.locale}", expires_in: 1.day) do
      case I18n.locale
      when :en
        image_tag "icons/us.svg", width: 20, height: 20, class: "me-2"
      when :ru
        image_tag "icons/ru.svg", width: 20, height: 20, class: "me-2"
      end
    end
  end

  def ru_language_item
    I18n.locale == :ru ? "Русский" : "Russian"
  end
  
  def en_language_item
    I18n.locale == :ru ? "Английский" : "English"
  end
end