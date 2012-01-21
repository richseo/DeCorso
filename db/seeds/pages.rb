::Page.reset_column_information
# Check whether all columns are applied yet by seo_meta.
unless !defined?(::SeoMeta) || ::SeoMeta.attributes.keys.all? { |k|
  ::Page.translation_class.instance_methods.map(&:to_sym).include?(k)
}
  # Make pages model seo_meta because not all columns are accessible.
  ::Page.translation_class.send :is_seo_meta
end

home_page = Page.create(:title => "Home",
            :deletable => false,
            :link_url => "/",
            :position => 0)
home_page.parts.create({
              :title => "Body",
              :body => "<p>Welcome to our site. This is just a place holder page while we gather our content.</p>",
              :position => 0
            })

page_not_found_page = home_page.children.create(:title => "Page not found",
            :menu_match => "^/404$",
            :show_in_menu => false,
            :deletable => false,
            :position => 0)
page_not_found_page.parts.create({
              :title => "Body",
              :body => "<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href='/'>Return to the home page</a></p>",
              :position => 0
            })

about_us_page = Page.create(:title => "About",
            :deletable => true,
            :position => -1)
about_us_page.parts.create({
              :title => "Body",
              :body => IO.read(File.join(Rails.root, 'db', 'seeds', 'about_page.html')),
              :position => 0
            })

home_page = Page.create(:title => "Contact",
            :deletable => true,
            :position => -5)
home_page.parts.create({
              :title => "Body",
              :body => IO.read(File.join(Rails.root, 'db', 'seeds', 'contact_page.html')),
              :position => 0
            })
