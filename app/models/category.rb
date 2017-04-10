class Category < ActiveRecord::Base
  translates :name, :shortname

  validates :name, :group, presence: true

  has_many :archives
  has_many :videos

  has_many :subcategories, :class_name => 'Category', :foreign_key => 'parent_id', :dependent => :destroy
  belongs_to :parent_category, :class_name => 'Category'
end
