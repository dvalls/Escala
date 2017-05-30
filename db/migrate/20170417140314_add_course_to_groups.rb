class AddCourseToGroups < ActiveRecord::Migration[5.0]
  def up
    add_column :content_video_groups, :course_id, :integer, :index => true
    add_column :content_library_groups, :course_id, :integer, :index => true
  end
end
