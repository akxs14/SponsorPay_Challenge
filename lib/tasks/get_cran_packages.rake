# encoding: utf-8
require 'open-uri'
require 'uri'
require 'fileutils'
require 'dcf'

namespace :sponsorpay do
  desc "retrieve and persist all the package data from a CRAN server"
  task :get_cran => :environment do
    Dir.mkdir('tmp/CRANImporter')
    importer = CRANImporter.new
    importer.import_packages(importer.get_package_list)
    # FileUtils.rm_rf('tmp/CRANImporter')
  end
end

class CRANImporter
  PACKAGES = "http://cran.r-project.org/src/contrib/PACKAGES"
  LINES_PER_PACKAGE = 9

  def get_package_list
    (open(PACKAGES).read).split(/^$\n/)
  end

  def import_packages(package_list)
    # package_list.each do |item|
      item =  package_list.first
      package = Dcf.parse(item).first
      package_file = fetch_package_file(assemble_package_url(package["Package"], package["Version"]))
      unzip_file(package_file)
    # end
  end

  def assemble_package_url(name, version)
    "http://cran.r-project.org/src/contrib/#{name}_#{version}.tar.gz"
  end

  def fetch_package_file(url)
    local_file = "tmp/CRANImporter/" + File.basename(URI.parse(url).path)
    open(local_file,"wb") do |file|
      open(url) {|uri| file.write(uri.read)}
    end
    local_file
  end

  def unzip_file(file)
    `tar -xf #{file} -C tmp/CRANImporter`
  end

end

