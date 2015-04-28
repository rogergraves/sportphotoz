module AwsTools

  def self.bucket
    @bucket ||= Aws::S3::Resource.new.bucket('sportphotoz')
  end

  def self.share_object(key, expires_in)
    bucket.object(key).presigned_url(:get, expires_in: expires_in)
  end
end