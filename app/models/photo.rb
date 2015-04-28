class Photo < ActiveRecord::Base

  belongs_to :participant
  belongs_to :marathon

  # TODO
  # original
  # preview

  belongs_to :marathon
  
  validates :aws_key, presence: true
  validates :participant_id, presence: true
  validates :marathon_id, presence: true

end
