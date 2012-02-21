class AddStaffTypeAndGrade < ActiveRecord::Migration

  def self.up
    # :staff_type should be either 'Teacher' or 'Administration'
    # if 'Teacher" a number grade should be specified
    #
    add_column :staff_members, :staff_type, :string, :default => 'Administration', :null => false
    add_column :staff_members, :grade,      :integer
  end

  def self.down
    remove_column :staff_members, :staff_type
    remove_column :staff_members, :grade
  end
end
