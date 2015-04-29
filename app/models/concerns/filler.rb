require 'active_support/concern'

module Filler
  extend ActiveSupport::Concern


  # Fetches photos and participants from info.csv on AWS
  def fill_up
    CSV.parse(get_csv) do |row|
      data = parse_row(row)
      next unless data
      participant = Participant.find_or_create_by(bib: data[:bib], marathon: self)
      Photo.create(aws_key: data[:file], participant: participant, marathon: self)
    end
  end

  private

  def get_csv
    AwsTools::bucket.objects(prefix: "marathons/#{aws_prefix}/", delimiter: '/').each do |object|
      return object.get.body.read if object.key.split('/').last == 'info.csv'
    end
  end

  def parse_row(row)
    data = row.first.split(';')
    return if data[0] == 'File'
    result = {}
    result[:file] = data[0]
    result[:bib] = data[1].to_i unless data[1].blank?
    result
  end
end