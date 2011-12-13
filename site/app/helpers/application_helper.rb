module ApplicationHelper
  def truncate(text, length=20, sep='...')
    if text.length > length
      "#{text[0, length]}#{sep}"
    else
      text
    end
  end

  def latest_news
    raw(NewsItem.latest.map do |item|
      "<div class=\"title\">#{item.title}</div>
        <div class=\"publish-date\">#{item.publish_date.strftime("%B %d, %Y")}</div>
        <div class=\"body\">#{truncate(item.body, 300)}</div>"
    end.join('<br />'))
  end
end
