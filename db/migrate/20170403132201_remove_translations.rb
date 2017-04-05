class RemoveTranslations < ActiveRecord::Migration
  def change
    # drop_table :about_translations
    # drop_table :carousel_translations
    # drop_table :category_translations
    # drop_table :contact_translations
    # drop_table :feed_translations
    # drop_table :course_translations
    # # drop_table :schema_translations
    # drop_table :categories_material_files

    rename_table :material_files, :archives
  end
end
