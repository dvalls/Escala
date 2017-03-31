class CreateCoursesCategories < ActiveRecord::Migration
  def change
    create_table :courses_categories do |t|
      t.integer :category_id
      t.integer :course_id
    end
  end
end
