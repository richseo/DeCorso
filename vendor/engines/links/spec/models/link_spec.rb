require 'spec_helper'

describe Link do

  def reset_link(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @link.destroy! if @link
    @link = Link.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_link
  end

  context "validations" do
    
    it "rejects empty title" do
      Link.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_link
      Link.new(@valid_attributes).should_not be_valid
    end
    
  end

end