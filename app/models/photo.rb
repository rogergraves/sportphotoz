class Photo < ActiveRecord::Base

  belongs_to :bib
  belongs_to :event
  
  validates :url, uniqueness: true

end
