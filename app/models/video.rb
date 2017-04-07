class Video < ActiveRecord::Base

  validates :url, :title, :description, :course_id, presence: true

  belongs_to :course

end
