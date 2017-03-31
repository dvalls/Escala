class ChangeTableCategoriesCoursesToCategoriesMyCourses < ActiveRecord::Migration
  def change
    create_table :material_files do |t|
      t.string :name
      t.integer :category_id, index: true
      t.integer :my_course_id, index: true

      t.timestamps
    end


    rename_table 'categories_courses', 'categories_material_files'
  end
end
