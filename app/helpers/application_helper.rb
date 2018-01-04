module ApplicationHelper
  def markdown(body)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(body).html_safe
  end
end
