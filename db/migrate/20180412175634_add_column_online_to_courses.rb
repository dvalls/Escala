class AddColumnOnlineToCourses < ActiveRecord::Migration[5.0]
  def up
    add_column :courses, :online, :boolean, :default => false
  end

  def down
    remove_column :courses, :online
  end
end
