module ApplicationHelper
  def aws_bucket
    resource = Aws::S3::Resource.new
    @bucket = resource.bucket('sportphotoz')
  end
end
