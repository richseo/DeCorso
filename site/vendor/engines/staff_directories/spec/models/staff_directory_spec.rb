require 'spec_helper'

describe StaffDirectory do

  def reset_staff_directory(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @staff_directory.destroy! if @staff_directory
    @staff_directory = StaffDirectory.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_staff_directory
  end

  context "validations" do
    
    it "rejects empty name" do
      StaffDirectory.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_staff_directory
      StaffDirectory.new(@valid_attributes).should_not be_valid
    end
    
  end

end