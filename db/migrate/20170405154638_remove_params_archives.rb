class RemoveParamsArchives < ActiveRecord::Migration[5.0]
  def up
    remove_column :archives, :url
    remove_column :archives, :thumbnail
    remove_column :archives, :format
  end

  def down
    add_column :archives, :format, :string
    add_column :archives, :thumbnail, :string
    add_column :archives, :url, :string
  end
end
