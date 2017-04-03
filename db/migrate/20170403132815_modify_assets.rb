class ModifyAssets < ActiveRecord::Migration
  def change
    remove_column :assets, :my_course_id

    add_column :assets, :format, :string
    add_column :assets, :description, :string
    add_column :assets, :thumbnail, :string
    add_column :assets, :url, :string
  end
end
