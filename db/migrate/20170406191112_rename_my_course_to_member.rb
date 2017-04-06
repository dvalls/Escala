class RenameMyCourseToMember < ActiveRecord::Migration[5.0]
  def change
    rename_table :my_courses, :members
  end
end
