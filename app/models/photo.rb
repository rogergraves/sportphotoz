class Photo < ActiveRecord::Base
  belongs_to :event
  has_many :bibs
  validate_uniqueness_of :url
end
