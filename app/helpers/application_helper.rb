module ApplicationHelper
  def title(page_title)
    content_for :title do
      page_title
    end
  end

  def home_link
    root_path unless user_signed_in?
  end

  def flash_message_css_class(flash_type)
    { notice: "alert alert-info",
      success: "alert alert-success",
      error: "alert alert-danger",
      alert: "alert alert-warning" }[flash_type.to_sym] || "alert-info"
  end
end
