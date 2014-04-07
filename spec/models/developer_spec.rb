require 'spec_helper'

describe Developer do

  subject { Developer.new }

  describe "members" do
    it "should respond to name message" do
      subject.respond_to?(:name).should == true
    end

    it "should respond to email message" do
      subject.respond_to?(:email).should == true
    end    
  end

  describe "#packages" do
    it "should associate with the packages he authored" do
      package = Package.new()
      subject.authored_packages << package
      subject.authored_packages[0].should == package
    end

    it "should associate with the packages he maintained" do
      package = Package.new()
      subject.maintained_packages << package
      subject.maintained_packages[0].should == package
    end    
  end

end
