class Archive < ActiveRecord::Base

  validates :name, :description, :category_id , presence: true

  mount_uploader :url , ArchiveUploader

  belongs_to :category
  has_many :archives_images, :dependent => :destroy

  def get_category_name
    category = Category.find(category_id)
    return category.name
  end

end
