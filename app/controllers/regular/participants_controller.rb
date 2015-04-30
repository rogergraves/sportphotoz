class Regular::ParticipantsController < AdminController

  def show
    load_participant
  end

  private

  def load_marathon
    @marathon = Marathon.find_by(slug: params[:marathon_id])
  end

  def load_participant
    @participant = Participant.find_by(bib: params[:id])
  end

end