require 'aws_tools'
require 'csv'


class Marathon < ActiveRecord::Base

  include Filler

  has_many :participants
  has_many :photos

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :aws_prefix, presence: true, uniqueness: true

  def to_param
    slug
  end
end
