class Carousel < ActiveRecord::Base

  translates :title, :description
  mount_uploader :image_url, CarouselUploader

  validates  :image_url, :order, :title, presence: true

  belongs_to :course

end
