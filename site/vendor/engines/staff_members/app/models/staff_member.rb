class StaffMember < ActiveRecord::Base
  acts_as_indexed :fields => [:name, :email]

  validates :first_name, :presence => true, :uniqueness => true
  validates :last_name, :presence => true, :uniqueness => true
  
  belongs_to :photo, :class_name => 'Image'

  def name
    "#{first_name} #{last_name}"
  end
end
