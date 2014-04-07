require 'rake'
require_relative '../spec_helper.rb'
require_relative '../../lib/tasks/get_cran_packages.rake'

# testing rake task spopay:get_cran
# defined in file lib/tasks/get_cran_packages.rake

describe 'CRANImporter' do

  subject { CRANImporter.new }

  describe "#assemble_package_url" do
    it "should assemble the url for the given package and version" do
      subject.assemble_package_url("name","0.0.1").should == "http://cran.r-project.org/src/contrib/name_0.0.1.tar.gz"
    end
  end

end
