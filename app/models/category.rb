class Category < ActiveRecord::Base
  translates :name

  validates :name, presence: true

  has_many :library_files, :dependent => :destroy
  has_and_belongs_to_many :content_library_groups, :dependent => :destroy
  # has_many :content_videos

  has_many :subcategories, :class_name => 'Category', :foreign_key => 'parent_id', :dependent => :destroy
  belongs_to :parent_category, :class_name => 'Category'

  scope :sorted, lambda { order("parent_id ASC", "name ASC")}


  def parent_name
    case parent_id
      when nil
        return 'Raiz'
      else
        parent = Category.find(parent_id)
        return parent.name

    end
  end
end
