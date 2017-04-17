class AddParamsToTablesAgain < ActiveRecord::Migration[5.0]
  def up
    add_column :archives, :url, :string
    add_column :content_videos, :category_id, :integer, :index => true
    remove_column :categories, :shortname
    add_column :categories, :group, :string
  end

  def down
    remove_column :categories, :group
    add_column :categories, :shortname, :string
    remove_column :content_videos, :category_id
    remove_column :archives, :url
  end
end
