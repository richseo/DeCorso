module ApplicationHelper
  def latest_news(title="Latest News")
    html = NewsItem.latest(5).map do |item|
      "<div class=\"title\">#{link_to item.title, item}</div>
        <div class=\"publish-date\">Published #{item.publish_date.strftime("%B %d, %Y")}</div>
        <div class=\"body\">#{truncate(item.body, :length => 300, :omission => "#{link_to('... (continued)', item)}")}</div>"
    end.join('<br />')

    raw "<div id=\"news-feed\"><div class=\"news-feed-title\">#{title}</div>#{html}</div>"
  end

  def menu
    menu_html =
      @menu_pages.roots.map do |m|
        (m.url == request.path ? '<li class="selected">' : '<li>') +
        "#{link_to m.title, m.url}</li>"
      end.join('')

    html = <<-HTML
      <ul>
        #{menu_html}
      </ul>
    HTML

    raw html
  end

  def page_content(path, part=:body)
    p = Page.where(:link_url => path).first
    p && raw(p.content_for(part)) || ""
  end
end
