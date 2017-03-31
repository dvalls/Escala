class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.text :title
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
