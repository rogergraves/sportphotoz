class Participant < ActiveRecord::Base
  has_many :photos
  belongs_to :runner
  belongs_to :marathon

  validates :bib, uniqueness: { scope: [:runner, :marathon], message: 'The runner with same bib already taking part on marathon' }
  # validates :runner_id, presence: true # TODO: do this later
  validates :marathon, presence: true
end
