module Admin
  class StaffMembersController < Admin::BaseController
    before_filter :get_staff_types
    before_filter :get_grades

    crudify :staff_member,
            :title_attribute => 'name', :xhr_paging => true

    protected

    def get_staff_types
      @staff_types = StaffMember::STAFF_TYPES
    end

    def get_grades
      @grades = StaffMember::GRADES
    end
  end
end
