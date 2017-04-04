
CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = ENV['AMAZON_BUCKET_NAME']
  config.aws_acl    = :public_read
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

  config.aws_credentials = {
    access_key_id:     ENV['AMAZON_KEY_ID'],
    secret_access_key: ENV['AMAZON_ACCESS_KEY'],
    region: ENV['AMAZON_REGION']
  }
end