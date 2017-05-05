class Doc < ApplicationRecord
  validates :name, :description, :url, presence: true

  mount_uploader :url, ArchiveUploader

  has_and_belongs_to_many :content_docs_groups, :dependent => :destroy

end
