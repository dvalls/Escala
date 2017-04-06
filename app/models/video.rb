class Video < ApplicationRecord

  validates :url, :title, :description, presence: true

  belongs_to :course

end
