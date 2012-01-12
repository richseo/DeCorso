class StaffMember < ActiveRecord::Base
  acts_as_indexed :fields => [:name, :email]

  validates :last_name, :presence => true, :uniqueness => { :scope => :first_name }
  
  belongs_to :photo, :class_name => 'Image'

  def name
    "#{first_name} #{last_name}"
  end
end
