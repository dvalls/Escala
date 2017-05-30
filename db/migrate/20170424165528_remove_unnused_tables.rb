class RemoveUnnusedTables < ActiveRecord::Migration[5.0]
  def up
    drop_table :groups
    drop_table :videos
  end

  def down
    create_table :groups do |t|
      t.string :name
    end

    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :url
      t.integer :course_id
      t.integer :category_id

    end
  end
end
