class Archive < ActiveRecord::Base

  validates :name, :description, :category_id , presence: true

  mount_uploader :url , ArchiveUploader

  belongs_to :category
  belongs_to :course

  has_many :images, :as => :imageable, :dependent => :destroy

  # has_many :archives_images, :dependent => :destroy

  def get_category_name
    category = Category.find(category_id)
    return category.name
  end

end
