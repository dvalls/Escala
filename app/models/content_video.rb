class ContentVideo < ApplicationRecord

  validates :url, :title, :description,  presence: true

  has_and_belongs_to_many :content_video_groups, :dependent => :destroy

  # has_many :images, :as => :imageable, :dependent => :destroy

end
