class Regular::MarathonsController < RegularController

  def index
    if search_request?
      handle_search_request
    else
      @marathons = Marathon.all
    end
  end

  def show
    load_marathon
  end

  private

  def load_marathon
    @marathon = Marathon.find_by(slug: params[:id])
  end

  def search_request?
    !!params[:event]
  end

  def handle_search_request
    marathon = Marathon.find_by(slug: params[:event])
    participant = nil
    participant = marathon.participant(params[:bib]) if marathon

    if participant
      redirect_to regular_marathon_participant_path(participant.marathon, participant)
    else
      render partial: 'regular/marathons/participant_not_exist', locals: {bib: params[:bib]}
    end
  end
end