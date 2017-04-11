class Archive < ActiveRecord::Base

  validates :name, :description, :category_id , presence: true

  mount_uploader :cover_image , ArchiveUploader

  belongs_to :category
  belongs_to :course

  has_many :images, :as => :imageable, :dependent => :destroy

  def get_category_name
    category = Category.find(category_id)
    return category.name
  end

end
