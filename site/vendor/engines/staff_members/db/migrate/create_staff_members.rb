class CreateStaffMembers < ActiveRecord::Migration

  def self.up
    create_table :staff_members do |t|
      t.string :name
      t.string :email
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

    add_index :staff_members, :id

    load(Rails.root.join('db', 'seeds', 'staff_members.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "staff_members"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/staff_members"})
    end

    drop_table :staff_members
  end

end
