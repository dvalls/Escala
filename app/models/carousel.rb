class Carousel < ActiveRecord::Base

  translates :title, :description
  mount_uploader :image_url, CarouselUploader

  validates_presence_of :image_url, :order

  belongs_to :course

end
