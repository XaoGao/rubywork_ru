module ApplicationHelper
  def title(page_title)
    content_for :title do
      page_title
    end
  end
end
