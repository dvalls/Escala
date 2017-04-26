class LibraryFile < ActiveRecord::Base

  validates :name, :category_id , presence: true

  mount_uploader :url , ArchiveUploader

  belongs_to :category
  belongs_to :course
  belongs_to :page

  has_one :image, :as => :imageable, :dependent => :destroy

  def get_category_name
    category = Category.find(category_id)
    return category.name
  end

  def download_url
  S3 = AWS::S3.new.buckets[ 'bucket_name' ] # This can be done elsewhere as well,
                                            # e.g config/environments/development.rb

  url_options = {
    expires_in:                   60.minutes,
    use_ssl:                      true,
    # response_content_disposition: "attachment; filename=\"#{attachment_file_name}\""
    # "uploads/#{model.class.to_s.underscore}/#{model.id}"
  }

  S3.objects[ self.path ].url_for( :read, url_options ).to_s
end

end
