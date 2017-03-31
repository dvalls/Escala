class AddPublishtoCourses < ActiveRecord::Migration
  def change
    add_column :courses, :publish, :boolean
  end
end
