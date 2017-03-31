class CreateCoursesStudents < ActiveRecord::Migration
  def change
    create_table :courses_students do |t|
      t.integer :course_id, index: true
      t.integer :student_id, index: true
    end
  end
end
