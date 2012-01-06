module NavigationHelpers
  module Refinery
    module Links
      def path_to(page_name)
        case page_name
        when /the list of links/
          admin_links_path

         when /the new link form/
          new_admin_link_path
        else
          nil
        end
      end
    end
  end
end
