module ApplicationHelper
  def title(page_title)
    content_for :title do
      page_title
    end
  end

  def flash_message_css_class(flash_type)
    case flash_type
    when "notice" then "alert alert-info"
    when "success" then "alert alert-success"
    when "error" then "alert alert-danger"
    when "alert" then "alert alert-warning"
    end
  end
end
