class ModifyAssets < ActiveRecord::Migration
  def change
    remove_column :archives, :my_course_id

    add_column :archives, :format, :string
    add_column :archives, :description, :string
    add_column :archives, :thumbnail, :string
    add_column :archives, :url, :string
  end
end
