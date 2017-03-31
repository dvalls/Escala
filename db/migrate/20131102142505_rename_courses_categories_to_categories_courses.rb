class RenameCoursesCategoriesToCategoriesCourses < ActiveRecord::Migration
  def change
          rename_table :courses_categories, :categories_courses
  end
end
