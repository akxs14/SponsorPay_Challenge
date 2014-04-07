# encoding: utf-8
require 'open-uri'
require 'uri'
require 'fileutils'
require 'dcf'

namespace :sponsorpay do
  desc "retrieve and persist all the package data from a CRAN server"
  task :get_cran => :environment do
    FileUtils.mkdir_p('tmp/CRANImporter')
    importer = CRANImporter.new
    importer.import_packages(importer.get_package_list)
    # FileUtils.rm_rf('tmp/CRANImporter')
  end
end

class CRANImporter
  def packages
    "http://cran.r-project.org/src/contrib/PACKAGES"
  end

  def tmp_folder
    "tmp/CRANImporter"
  end

  def lines_per_package
    9
  end

  def get_package_list
    (open(packages).read).split(/^$\n/)
  end

  def import_packages(package_list)
    # package_list.each do |item|
      item =  package_list.first
      package = Dcf.parse(item).first

      package_file = fetch_package_file(assemble_package_url(package["Package"], package["Version"]))
      unzip_file(package_file)

      pack = Package.find_or_initialize_by_name(package["Package"])
      pack_version, author, maintainer = read_package_version_data(package_description(tmp_folder,package["Package"]))
      add_version_data(pack, pack_version, author, maintainer).save
    #end
  end

  def add_version_data(package, pack_version, author, maintainer)
    package.package_versions << pack_version if !package.package_versions.find_by_version(pack_version.version)
    # package.authors << author if !package.authors.find_by_name(author.name)
    # package.maintainers << maintainer if !package.maintainers.find_by_name(maintainer.name)
    package
  end

  def package_description(folder, package_name)
    "#{folder}/#{package_name}/DESCRIPTION"
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

  def add_developer(dev_data)
    dev = Developer.find_or_initialize_by_name(dev_data[0])
    dev.email = dev_data[1] if dev_data[1]
    dev
  end

  def read_package_version_data(package_description)
    file = open(package_description).read
    data = Dcf.parse(file)[0]
    [ 
      PackageVersion.new(
        version: data["Version"],
        dependencies: data["Depends"],
        suggestions: data["Suggests"],
        pub_date: data["Date/Publication"],
        title: data["Title"],
        description: data["Description"],
        license: data["License"]
      ),
      add_developer(data["Author"].split("<")),
      add_developer(data["Maintainer"].split("<"))
    ]
  end

end

