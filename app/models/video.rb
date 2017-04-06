class Video < ApplicationRecord

  validates :url, :title, :description, :course_id, presence: true

  belongs_to :course

end
