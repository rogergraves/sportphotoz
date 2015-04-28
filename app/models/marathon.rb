require 'aws_tools'

class Marathon < ActiveRecord::Base

  has_many :participants
  has_many :photos

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :aws_prefix, presence: true, uniqueness: true


  def parse_photos
    AwsTools::bucket.objects(prefix: "marathons/#{aws_prefix}/", delimiter: '/').each do |object|
      if object.key.split('/').last == 'info.csv'
        # f = CSV::open(share_object(object.key, 60))
        CSV.parse(object.get.body.read) do |row|
          file, bib = row.first.split(';')
          next if file == 'File'
          participant = Participant.find_or_create_by(bib: bib.to_i, marathon: self)
          participant.photos.build(aws_key: file, marathon: self)
          participant.save!
        end

      end
    end
  end
end
