class ContentLibraryGroup < ApplicationRecord
  validates :name, :category_id, :course_id, presence: true

  belongs_to :category

  has_many :content_blocks, as: :contentable, :dependent => :destroy


  belongs_to :course
end
