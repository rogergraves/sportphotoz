class MarathonsController < ApplicationController
  # before_action :set_bucket

  def index
    @marathons = Marathon.all
    # parse_photos 'BostonMarathon2015'
    # @marathons_list = @bucket.objects(prefix: 'marathons/BostonMarathon2015/', delimiter: '/').collect(&:key)
    # raise
    # @marathons_list = @bucket.objects(prefix: 'marathons/marathons/BostonMarathon2015', delimiter: '/').map { |o| o.key }
    # @marathons_list = @bucket.objects.with_prefix('marathons').collect(&:key)
    # @marathons_list = @bucket.objects(prefix: 'marathons/').collect(&:key)
    # s3 = Aws::S3::Client.new
    # @marathons_list = s3.list_objects(bucket: 'sportphotoz', max_keys: 2)
    # raise
  end

  def show
    load_marathon
    # client = Aws::S3::Client.new
    # resource = Aws::S3::Resource.new
    # Aws::Resources::Collection
    # resource.bucket('sportphotoz').objects(prefix: '/marathons/BostonMarathon2015/original/').count

  end

  def new
    @marathon = Marathon.new
  end

  def create
    if save_marathon
      # parse_photos(@marathon.aws_prefix)
      # @marathon.parse_photos
      redirect_to @marathon, notice: 'Marathon was successfully created.'
    else
      render :new
    end
  end

  def edit
    load_marathon
  end

  def update
    load_marathon
    if save_marathon
      redirect_to @marathon, notice: 'Marathon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # TODO
    load_marathon
  end

  private

  # def set_bucket
  #   resource = Aws::S3::Resource.new
  #   @bucket = resource.bucket('sportphotoz')
  # end

  def load_marathon
    @marathon = Marathon.find(params[:id])
  end

  def marathon_params
    params.require(:marathon).permit(:name, :slug, :aws_prefix)
  end

  def save_marathon
    @marathon ||= Marathon.new
    @marathon.attributes = marathon_params
    @marathon.save
    @marathon.parse_photos
    @marathon
  end

  # def parse_photos(aws_prefix)
  #
  #   @bucket.objects(prefix: "marathons/#{aws_prefix}/", delimiter: '/').each do |object|
  #     if object.key.split('/').last == 'info.csv'
  #       # f = CSV::open(share_object(object.key, 60))
  #       CSV.parse(object.get.body.read) do |row|
  #
  #         file, bib = row.first.split(';')
  #         next if file == 'File'
  #         participant = Participant.find_or_create_by(bib: bib.to_i)
  #         participant.photos.build(aws_key: file, marathon: @marathon)
  #         participant.save!
  #       end
  #
  #     end
  #   end
  # end
  #
  # def share_object(key, expires_in)
  #   @bucket.object(key).presigned_url(:get, expires_in: expires_in)
  # end
end
