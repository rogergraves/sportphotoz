class Bib < ActiveRecord::Base
  belongs_to :photo
  validates :number, uniqueness: true
end
