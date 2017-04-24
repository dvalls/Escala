class Doc < ApplicationRecord
  validates :name, :description, :url, presence: true

  mount_uploader :url, ArchiveUploader

  has_and_belongs_to_many :content_docs_groups


  def download_url(style_name=:original)
    url.s3_bucket.objects[creative.s3_object(style_name).key].url_for(:read,
                                                                           :secure => true,
                                                                           :expires => 24*3600,  # 24 hours
                                                                           :response_content_disposition => "attachment; filename='#{url_file_name}'").to_s
  end

end
