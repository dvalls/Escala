class CreateAbouts < ActiveRecord::Migration
  def up
    create_table :abouts do |t|

      t.timestamps
    end
    About.create_translation_table! :body => :text
  end

  def down
    drop_table :abouts
    About.drop_translation_table!
  end
end
