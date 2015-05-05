class Regular::CartsController < RegularController
  def show
    @order_items = current_order.order_items
  end
end