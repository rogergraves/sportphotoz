class Admin::MarathonsController < AdminController
  # before_action :set_bucket

  def index
    @marathons = Marathon.all
  end

  def show
    load_marathon
  end

  def new
    @marathon = Marathon.new
  end

  def create
    if save_marathon
      redirect_to admin_marathon_path(@marathon), notice: 'Marathon was successfully created.'
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
      redirect_to admin_marathon_path(@marathon), notice: 'Marathon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # TODO
    load_marathon
  end

  private

  def load_marathon
    @marathon = Marathon.find_by(slug: params[:id])
  end

  def marathon_params
    params.require(:marathon).permit(:name, :slug, :aws_prefix)
  end

  def save_marathon
    @marathon ||= Marathon.new
    @marathon.attributes = marathon_params
    @marathon.save
    @marathon.fill_up
    @marathon
  end

end
