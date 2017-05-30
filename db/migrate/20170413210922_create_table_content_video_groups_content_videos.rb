class CreateTableContentVideoGroupsContentVideos < ActiveRecord::Migration[5.0]
  def up
    create_table :content_video_groups_videos do |t|
      t.integer :content_video_id
      t.integer :content_video_group_id
    end

    remove_column :content_videos, :content_video_group_id
  end

  def down
    add_column  :content_videos, :content_video_group_id, :integer

    drop_table :content_video_groups_videos
  end
end
