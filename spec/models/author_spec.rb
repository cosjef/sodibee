require 'spec_helper'

  describe Author do
    it "should be created if name is provided" do
      Author.create(name: "test").should be_valid
    end
    
    it "should not be created without a name" do
      Author.create.should_not be_valid
    end
  end