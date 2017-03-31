class CreateI18nFeeds < ActiveRecord::Migration
  def up
    Feed.create_translation_table!({
                                       :title => :text,
                                       :body => :text
                                   }, {
                                       :migrate_data => true
                                   })
  end

  def down
    Feed.drop_translation_table! :migrate_data => true
  end
end
