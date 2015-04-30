class Regular::MarathonsController < RegularController

  def index
    @marathons = Marathon.all
  end

  def show
    load_marathon
  end

  private

  def load_marathon
    @marathon = Marathon.find_by(slug: params[:id])
  end
end