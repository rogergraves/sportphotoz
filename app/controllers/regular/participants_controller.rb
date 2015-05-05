class Regular::ParticipantsController < RegularController

  def show
    load_participant
    @order_item = current_order.order_items.new
  end

  private

  def load_marathon
    @marathon = Marathon.find_by(slug: params[:marathon_id])
  end

  def load_participant
    @participant = Participant.find_by(bib: params[:id]).decorate
  end

end