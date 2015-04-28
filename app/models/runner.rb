class Runner < ActiveRecord::Base
  enum gender: [:undefined, :male, :female]

  has_many :participants

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true, uniqueness: true
end
