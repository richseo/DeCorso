class ChangeStaffMemberGradeToString < ActiveRecord::Migration
  def self.up
    remove_column :staff_members, :grade
    add_column :staff_members, :grade, :string
  end

  def self.down
    remove_column :staff_members, :grade
    add_column :staff_members, :grade, :integer
  end
end
