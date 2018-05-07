class Page < ApplicationRecord
  validates :name, :course_id, presence: true

  belongs_to :course

  has_many :content_blocks, :dependent => :destroy

  has_many :images, :as => :imageable, :dependent => :destroy



  def name_and_course
    "#{name} - #{course.title}"
  end

end
