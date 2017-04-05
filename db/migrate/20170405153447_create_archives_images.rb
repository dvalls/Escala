class CreateArchivesImages < ActiveRecord::Migration[5.0]
  def up
    create_table :archives_images do |t|

      t.string :title
      t.text :description
      t.text :url

      t.integer :archive_id

      t.timestamps
    end
    add_index :archives_images, :archive_id
  end

  def down
    drop_table :archives_images
  end
end
