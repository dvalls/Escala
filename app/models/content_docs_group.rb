class ContentDocsGroup < ApplicationRecord

  validates :name, :course_id, presence: true

  has_and_belongs_to_many :docs

  belongs_to :course
end
