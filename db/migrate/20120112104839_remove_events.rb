class RemoveEvents < ActiveRecord::Migration
  def self.up
    UserPlugin.destroy_all({:name => "events"})

    Page.delete_all({:link_url => "/events"})

    drop_table :events
    drop_table :event_categories
    drop_table :event_categorizations
  end

  def self.down
  end
end
