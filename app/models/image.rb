class Image < ActiveRecord::Base

  before_save :update_image_attributes
  validates_presence_of :url

  belongs_to :imageable, :polymorphic => true

  mount_uploader :url, ImageUploader

  scope :newest, lambda { order('created_at DESC')}

  # Store Height & Width on DB
  def update_image_attributes
    if imageable.present?
      self.width, self.height = `identify -format "%wx%h" #{url.file.path}`.split(/x/)
    end
  end

end
