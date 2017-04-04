class Asset < ActiveRecord::Base

  validates :name, :description, :category_id , presence: true

  mount_uploader :url , AssetUploader

  belongs_to :categories
  has_many :images, :as => :imageable, :dependent => :destroy

  def get_category_name
    category = Category.find(category_id)
    return category.name
  end

end
