class Regular::PhotosController < RegularController

  def index
    load_marathon

    if only_orphans?
      @photos = @marathon.photos.orphans
    else
      @photos = if participant_required?
                  load_participant
                  photos_for_participant
                else
                  photos_for_marathon
                end
    end
  end

  private

  def load_marathon
    @marathon = Marathon.find_by(slug: params[:marathon_id])
  end

  def load_participant
    @participant = @marathon.participant(params[:participant_id])
  end

  def only_orphans?
    params[:only] == 'orphans'
  end

  def participant_required?
    !!params[:participant_id]
  end

  def photos_for_participant
    @participant.photos
  end

  def photos_for_marathon
    @marathon.photos
  end
end