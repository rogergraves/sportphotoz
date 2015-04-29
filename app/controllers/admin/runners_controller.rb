class Admin::RunnersController < AdminController

  def show
    load_participant
  end

  def load_marathon
    @marathon = Marathon.find_by(slug: params[:marathon_id])
  end

  def load_participant
    @participant = Participant.find_by(bib: params[:id])
  end

end