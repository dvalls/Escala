class TranslateAbout < ActiveRecord::Migration
  def self.up
    About.create_translation_table! :body => :text

  end

  def self.down
    About.drop_translation_table! :migrate_data => true
  end
end
