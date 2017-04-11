class ModifyArchiveCoverImage < ActiveRecord::Migration[5.0]
  def change
    rename_column :archives, :cover_image, :url
  end
end
