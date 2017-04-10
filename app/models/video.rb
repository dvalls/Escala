class Video < ApplicationRecord

  validates :url, :title, :description, :course_id, presence: true

  belongs_to :course
  belongs_to :category
  has_many :images, :as => :imageable, :dependent => :destroy


end
