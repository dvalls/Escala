class Video < ApplicationRecord

  validates :url, :title, :description, :course_id, presence: true
  validates_numericality_of :course_id, :category_id

  belongs_to :course
  belongs_to :category
  has_many :images, :as => :imageable, :dependent => :destroy

end
