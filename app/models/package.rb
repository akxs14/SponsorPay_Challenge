class Package < ActiveRecord::Base
  has_many :package_versions
  has_and_belongs_to_many :authors, :class_name => "Developer", :join_table => "authors_packages"
  has_and_belongs_to_many :maintainers, :class_name => "Developer", :join_table => "maintainers_packages"
end
