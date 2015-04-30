class Participant < ActiveRecord::Base
  has_many :photos
  belongs_to :runner
  belongs_to :marathon

  default_scope { order(:bib) }

  validates :bib, presence: true, uniqueness: { scope: [:runner, :marathon], message: 'The runner with same bib already taking part on marathon' }
  # validates :runner, presence: true # TODO: do this later
  validates :marathon, presence: true

  def to_param
    bib.to_s
  end
end
