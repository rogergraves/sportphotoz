class Admin::PhotosController < AdminController

  def index
    load_marathon

    if only_orphans?
      @photos = @marathon.photos.orphans
    else
      @photos = @marathon.photos
    end
  end

  def load_marathon
    @marathon = Marathon.find_by(slug: params[:marathon_id])
  end

  private

  def only_orphans?
    params[:only] == 'orphans'
  end
end