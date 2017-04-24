class RemoveATonOfParams < ActiveRecord::Migration[5.0]
  def up
    # rename_table :videos, :content_videos
    create_table :content_videos do |t|
      t.string :title
      t.string :description
      t.string :url
    end

    # remove_column :content_videos, :category_id
    # remove_column :content_videos, :course_id
    remove_column :archives, :course_id

    # add_column :content_videos, :page_id, :integer
    add_column :archives, :page_id, :integer

    create_table :pages do |t|
      t.string :name
      t.integer :course_id, :index => true
      t.integer :template_id
      t.string :template_type
    end
  end

  def down
    drop_table :pages

    remove_column :archives, :page_id
    remove_column :content_videos, :page_id

    add_column :archives, :course_id, :integer
    add_column :content_videos, :course_id, :integer
    add_column :content_videos, :category_id, :integer

  end
end
