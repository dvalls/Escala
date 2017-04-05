class ArchivesImage < ApplicationRecord

  validates :url, :description, :title

  belongs_to :archive
end
