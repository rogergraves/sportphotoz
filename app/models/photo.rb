require 'aws_tools'

class Photo < ActiveRecord::Base

  belongs_to :participant
  belongs_to :marathon

  scope :orphans, -> { where(participant_id: nil ) }

  validates :aws_key, presence: true, uniqueness: { scope: :marathon_id, message: 'should be once per marathon' }
  validates :marathon_id, presence: true

  # Generates public url for original photo for a 5 minutes
  def original_url
    AwsTools::share_object(original_key, 360)
  end

  # Thumb images on AWS must be public.
  def thumb_url
    AwsTools::get_object(thumb_key).public_url
  end

  def original_key
    "marathons/#{marathon.aws_prefix}/original/#{aws_key}"
  end

  def thumb_key
    "marathons/#{marathon.aws_prefix}/thumb/#{aws_key}"
  end
end
