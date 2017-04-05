class Category < ActiveRecord::Base
  translates :name, :shortname

  validates :name, :shortname, presence: true

  has_many :archives

  has_many :subcategories, :class_name => 'Category', :foreign_key => 'parent_id', :dependent => :destroy
  belongs_to :parent_category, :class_name => 'Category'
end
