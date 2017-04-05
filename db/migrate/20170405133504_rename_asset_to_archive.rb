class RenameAssetToArchive < ActiveRecord::Migration[5.0]
  def up
    rename_table :assets, :archives
  end

  def down
    rename_table :archives, :assets
  end
end
