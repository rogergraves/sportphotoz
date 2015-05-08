class Regular::OrdersController < RegularController

  def show
    @order = Order.find_by(slug: params[:id])
    raise not_found unless @order.paid?
  end

end