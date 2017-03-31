class CreateMyCourses < ActiveRecord::Migration
  def change
    create_table :my_courses do |t|

      t.timestamps null: false
    end
  end
end
