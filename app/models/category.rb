class Category < ActiveRecord::Base
  translates :name, :shortname

  has_and_belongs_to_many :material_files

  has_many :subcategories, :class_name => 'Category', :foreign_key => 'parent_id', :dependent => :destroy
  belongs_to :parent_category, :class_name => 'Category'
end
