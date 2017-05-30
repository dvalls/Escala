class RenameGroupToContentBlaGroup < ActiveRecord::Migration[5.0]
  def change
    rename_column :content_videos, :group_id, :content_video_group_id
  end
end
