class Course < ActiveRecord::Base

  validates :title, :description, :year, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  # i18n
  translates :title, :description, :body

  # Cover image
  mount_uploader :cover_image, CoverImageUploader

  has_many :images, :as => :imageable, :dependent => :destroy
  has_many :carousels, :dependent => :destroy

  has_many :content_library_groups, :dependent => :destroy
  has_many :content_video_groups, :dependent => :destroy
  has_many :content_docs_groups, :dependent => :destroy
  has_many :pages, :dependent => :destroy

  has_and_belongs_to_many :students

end
