class Regular::PhotosController < AdminController

  def index
    if only_orphans?
      @photos = @marathon.photos.orphans
    else
      @photos = @marathon.photos
    end
  end

  private

  def load_marathon
    @marathon = Marathon.find_by(slug: params[:marathon_id])
  end

  def only_orphans?
    params[:only] == 'orphans'
  end
end