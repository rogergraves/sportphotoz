class Photo < ActiveRecord::Base
  belongs_to :event
  has_many :bibs
  validates :url, uniqueness: true
end
