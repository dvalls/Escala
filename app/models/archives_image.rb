class ArchivesImage < ApplicationRecord

  validates :url, presence: true

  belongs_to :archive




  # def download_url(style_name=:original)
  #   creative.s3_bucket.objects[creative.s3_object(style_name).key].url_for(:read,
  #                                                                          :secure => true,
  #                                                                          :expires => 24*3600,  # 24 hours
  #                                                                          :response_content_disposition => "attachment; filename='#{creative_file_name}'").to_s
  # end
  #
  #
  # <%= link_to 'Download Creative', event.download_url, class: "btn btn-info" %>

end
