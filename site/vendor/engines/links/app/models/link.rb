class Link < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :url]

  validates :title, :presence => true, :uniqueness => true
  
end
