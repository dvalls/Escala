class ContentLink < ApplicationRecord

  validates :name, :link, :presence => true

  has_many :content_blocks, as: :contentable, :dependent => :destroy

  belongs_to :course


end
