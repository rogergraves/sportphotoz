class Bib < ActiveRecord::Base
  belongs_to :photo
  validate_uniqueness_of :number
end
