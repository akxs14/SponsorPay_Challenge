class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    create_table :developers_packages do |t|
      t.belongs_to :developers
      t.belongs_to :packages
    end
  end
end


