class RemovePageIdFromVideosArchives < ActiveRecord::Migration[5.0]
  def up
    remove_column :content_videos, :page_id
    remove_column :archives, :page_id

    rename_table :templates, :content_blocks
  end

  def down
    rename_table :content_blocks, :templates

    add_column :archives, :page_id, :integer
    add_column :content_videos, :page_id, :integer
  end
end
