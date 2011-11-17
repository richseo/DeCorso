module Admin
  class StaffDirectoriesController < Admin::BaseController

    crudify :staff_directory,
            :title_attribute => 'name', :xhr_paging => true

  end
end
