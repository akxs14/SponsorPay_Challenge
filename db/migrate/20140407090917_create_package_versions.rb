class CreatePackageVersions < ActiveRecord::Migration
  def change
    create_table :package_versions do |t|
      t.string :version
      t.string :r_version
      t.string :dependencies
      t.string :suggestions
      t.date :pub_date
      t.string :title
      t.string :description
      t.string :license
      t.integer :package_id, index: true

      t.timestamps
    end

  end
end
