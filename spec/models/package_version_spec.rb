require 'spec_helper'

describe PackageVersion do
  subject { PackageVersion.new }

  describe "members" do
    it "should respond to version message" do
      subject.respond_to?(:version).should == true
    end

    it "should respond to r_version message" do
      subject.respond_to?(:r_version).should == true
    end

    it "should respond to dependencies message" do
      subject.respond_to?(:dependencies).should == true
    end

    it "should respond to suggestions message" do
      subject.respond_to?(:suggestions).should == true
    end

    it "should respond to pub_date message" do
      subject.respond_to?(:pub_date).should == true
    end

    it "should respond to title message" do
      subject.respond_to?(:title).should == true
    end

    it "should respond to description message" do
      subject.respond_to?(:description).should == true
    end

    it "should respond to license message" do
      subject.respond_to?(:license).should == true
    end                        
  end

  describe "PackageVersion / Package association" do
    it "should be associated with one package" do
      package = Package.new
      subject.package = package
      subject.package.should == package      
    end
  end

end
