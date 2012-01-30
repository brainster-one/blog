module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(SyntaxHighlighter, :autolink => true, :space_after_headers => true, :fenced_code_blocks => true)
    markdown.render(text).html_safe
  end
end

class SyntaxHighlighter < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div
  end
end