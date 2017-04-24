class ContentVideoGroup < ApplicationRecord

  validates :name, :course_id, presence: true

  has_and_belongs_to_many :content_videos, :dependent => :destroy

  has_many :content_blocks, as: :contentable, :dependent => :destroy

  belongs_to :course
end