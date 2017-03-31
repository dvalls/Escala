class HtmlWithMarkdown < Redcarpet::Render::HTML

  def initialize(options={})
    super options.merge(:hard_wrap => true, :link_attributes => { rel: 'nofollow' })
  end

def image(link, title, alt_text)
  "<img data-original='#{link}' src='#{link}' alt='#{alt_text}' class='img-responsive center-block'>"
end

def block_quote(quote)
  "<div class='column-2'>#{quote}</div>"
end

end