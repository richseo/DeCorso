class ChangeNameToFirstNameAndLastName < ActiveRecord::Migration
  def self.up
    add_column :staff_members, :first_name, :string
    add_column :staff_members, :last_name, :string

    StaffMember.all.each do |m|
      f, l = m.name.split(/\s+/)
      m.first_name = f
      m.last_name = l
      m.save!
    end

    remove_column :staff_members, :name
  end

  def self.down
    add_column :staff_members, :name

    StaffMember.all.each do |m|
      m.name = "#{m.first_name} #{m.last_name}"
      m.save!
    end

    remove_column :staff_members, :first_name
    remove_column :staff_members, :last_name
  end
end
