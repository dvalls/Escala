class CreateContentLinks < ActiveRecord::Migration[5.0]
  def up
    create_table :content_links do |t|
      t.integer :course_id
      t.string :name
      t.string :link
      t.string :description

    end
  end

  def down
    drop_table :content_links
  end
end
