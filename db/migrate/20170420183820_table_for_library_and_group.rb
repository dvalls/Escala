class TableForLibraryAndGroup < ActiveRecord::Migration[5.0]
  def up
    create_table :categories_content_library_groups do |t|
      t.integer :content_library_group_id
      t.integer :category_id
    end
  end

  def down
    drop_table :categories_content_library_groups
  end
end
