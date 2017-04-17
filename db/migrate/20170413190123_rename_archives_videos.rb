class RenameArchivesVideos < ActiveRecord::Migration[5.0]
  def up
    rename_table :videos, :content_videos
    rename_table :archives, :library_files

    create_table :content_video_group do |t|
      t.string :name

    end

    create_table :content_library_group do |t|
      t.string :name
      t.integer :category_id, index: true
    end

    add_column :content_blocks, :order, :integer
    add_column :content_blocks, :contentable_id, :integer
    add_column :content_blocks, :contentable_tye, :string
  end

  def down
    remove_column :content_blocks, :contentable_tye
    remove_column :content_blocks, :contentable_id
    remove_column :content_blocks, :order

    drop_table :content_library_group

    drop_table :content_video_group

    rename_table :content_videos, :videos
    rename_table :library_files, :archives


  end
end
