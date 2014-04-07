require 'spec_helper'

describe Package do
  subject { Package.new }

  describe "members" do
    it "should respond to name message" do
      subject.respond_to?(:name).should == true
    end
  end

  describe "#authors" do
    it "should associate with the authors" do
      dev = Developer.new()
      subject.authors << dev
      subject.authors[0].should == dev
    end
  end

  describe "#maintainers" do
    it "should associate with the maintainers" do
      dev = Developer.new()
      subject.maintainers << dev
      subject.maintainers[0].should == dev
    end
  end

  describe "#package_versions" do
    it "should associate with the package versions" do
      ver = PackageVersion.new()
      subject.package_versions << ver
      subject.package_versions[0].should == ver
    end
  end

end
