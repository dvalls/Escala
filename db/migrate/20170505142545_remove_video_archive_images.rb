class RemoveVideoArchiveImages < ActiveRecord::Migration[5.0]
  def change
    drop_table :videos
    drop_table :archives_images
  end
end
