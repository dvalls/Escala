class CreateDocs < ActiveRecord::Migration[5.0]
  def up
    create_table :docs do |t|
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end

    create_table :content_docs_groups do |t|
      t.string :name
      t.integer :course_id, index: true
    end

    create_table :content_docs_groups_docs do |t|
      t.integer :doc_id
      t.integer :content_docs_group_id
    end
  end

  def down
    drop_table :docs
    drop_table :content_docs_groups
    drop_table :content_docs_groups_docs
  end
end
