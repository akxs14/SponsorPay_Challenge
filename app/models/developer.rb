class Developer < ActiveRecord::Base
  has_and_belongs_to_many :authored_packages, :class_name => "Package", :join_table => "authors_packages"
  has_and_belongs_to_many :maintained_packages, :class_name => "Package", :join_table => "maintainers_packages"  
end
