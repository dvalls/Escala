class Feed < ActiveRecord::Base

  #before_save :update_image_attributes

  translates :title, :body
  mount_uploader :image, FeedImageUploader

  private

  # TODO Avaliar necessidade disto
  # def update_image_attributes
  #   if image.present?
  #     #self.content_type = image.file.content_type
  #     self.file_size = image.file.size
  #     self.width, self.height = `identify -format "%wx%h" #{image.file.path}`.split(/x/)
  #   end
  # end
end
