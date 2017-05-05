class Page < ApplicationRecord
  validates :name, presence: true

  belongs_to :course

  has_many :content_blocks, :dependent => :destroy


  def name_and_course
    "#{name} - #{course.title}"
  end

end
