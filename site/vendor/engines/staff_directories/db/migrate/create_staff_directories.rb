class CreateStaffDirectories < ActiveRecord::Migration

  def self.up
    create_table :staff_directories do |t|
      t.string :name
      t.string :email
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

    add_index :staff_directories, :id

    load(Rails.root.join('db', 'seeds', 'staff_directories.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "staff_directories"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/staff_directories"})
    end

    drop_table :staff_directories
  end

end
