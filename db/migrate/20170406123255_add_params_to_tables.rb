class AddParamsToTables < ActiveRecord::Migration[5.0]
  def up
    add_column :content_videos, :course_id, :integer, :index => true
    add_column :archives, :course_id, :integer, :index => true
  end

  def down
    remove_column :archives, :course_id
    remove_column :content_videos, :course_id

  end
end
