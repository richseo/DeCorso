class CreateLinks < ActiveRecord::Migration

  def self.up
    create_table :links do |t|
      t.string :title
      t.string :url
      t.integer :position

      t.timestamps
    end

    add_index :links, :id

    load(Rails.root.join('db', 'seeds', 'links.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "links"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/links"})
    end

    drop_table :links
  end

end
