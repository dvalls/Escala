class RenameTemplateIdInPages < ActiveRecord::Migration[5.0]
  def change
    rename_column :pages, :template_id, :content_block_id
  end
end
