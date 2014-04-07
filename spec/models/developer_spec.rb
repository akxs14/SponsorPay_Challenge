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
    before do
      my_package = Package.new(:name => "MyPackage!")
      another_package = Package.new(:name => "AnotherPackage")
      subject.authored_packages << my_package
      subject.maintained_packages << another_package    
    end

    it "should correctly identify the packages the developer authored" do
      subject.authored_packages[0].name == "MyPackage!"
    end

    it "should correctly identify the packages the developer maintained" do
      subject.maintained_packages[0].name == "AnotherPackage"
    end    

    it "should not mix the authored and maintained packages" do
      subject.authored_packages.length.should == 1 && subject.maintained_packages.length.should == 1
    end
  end

end
