if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'staff_directories').blank?
      user.plugins.create(:name => 'staff_directories',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Staff Directories',
    :link_url => '/staff_directories',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/staff_directories(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end