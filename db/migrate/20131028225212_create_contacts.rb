class CreateContacts < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
      t.text :body
      t.timestamps
    end
    Contact.create_translation_table! :body => :text
  end

  def down
    drop_table :contacts
    Contact.drop_translation_table!
  end
end
