class ArchivesImage < ApplicationRecord

  validates :url, presence: true

  belongs_to :archive
end
