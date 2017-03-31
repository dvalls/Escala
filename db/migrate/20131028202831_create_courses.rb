class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.text :body
      t.date :year

      t.timestamps
    end
  end
end
