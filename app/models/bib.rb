class Bib < ActiveRecord::Base

  has_many :photos
  validates :number, uniqueness: true

end
