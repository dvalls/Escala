class RemoveGroupFromCategories < ActiveRecord::Migration[5.0]
  def up
    remove_column :categories, :group
  end

  def down
    add_column :categories, :group, :string
  end
end
