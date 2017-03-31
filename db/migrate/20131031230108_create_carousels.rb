class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.integer :course_id
      t.string :title
      t.string :description
      t.string :image_url
    end
    add_index :carousels, :course_id
  end
end
