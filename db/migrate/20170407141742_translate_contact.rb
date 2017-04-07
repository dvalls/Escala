class TranslateContact < ActiveRecord::Migration[5.0]
  def self.up
    Contact.create_translation_table!  :body => :text
  end

  def self.down
    Contact.drop_translation_table! :migrate_data => true
  end
end
