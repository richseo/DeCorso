if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'links').blank?
      user.plugins.create(:name => 'links',
                          :position => -4) #(user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Links',
    :link_url => '/links',
    :deletable => false,
    :position => -4,
    :menu_match => '^/links(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end
