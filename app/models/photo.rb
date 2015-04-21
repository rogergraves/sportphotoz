class Photo < ActiveRecord::Base
  
  validates :url, uniqueness: true

end
