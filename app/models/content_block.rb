class ContentBlock < ApplicationRecord

  validates :contentable_id, :contentable_type, :page_id, presence: true

  belongs_to :page

  belongs_to :contentable, :polymorphic => true
end
