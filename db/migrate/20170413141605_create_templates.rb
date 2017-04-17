class CreateTemplates < ActiveRecord::Migration[5.0]
  def up
    create_table :content_blocks do |t|
      t.integer :page_id, index: true
    end

    remove_column :pages, :template_type
    # remove_column :pages, :template_id

  end

  def down
    # add_column :pages, :template_id, :integer
    add_column :pages, :template_type, :string

    drop_table :templates
  end
end
