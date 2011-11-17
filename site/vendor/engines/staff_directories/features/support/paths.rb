module NavigationHelpers
  module Refinery
    module StaffDirectories
      def path_to(page_name)
        case page_name
        when /the list of staff_directories/
          admin_staff_directories_path

         when /the new staff_directory form/
          new_admin_staff_directory_path
        else
          nil
        end
      end
    end
  end
end
