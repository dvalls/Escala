class AddParamsToVideos < ActiveRecord::Migration[5.0]
  def up
    rename_column :content_blocks, :contentable_tye, :contentable_type

    rename_table :content_library_group, :content_library_groups
    rename_table :content_video_group, :content_video_groups


    add_column :content_videos, :group_id, :integer, :index => true
  end

  def down
    remove_column :content_videos, :group_id

    rename_table :content_video_groups, :content_video_group

    rename_table :content_library_groups, :content_library_group

    rename_column :content_blocks, :contentable_type, :contentable_tye
  end
end
