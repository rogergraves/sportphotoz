class Regular::OrderItemsController < RegularController
  def create
    load_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
    # render nothing: true

    respond_to do |format|
      format.js
    end
  end

  def update
    load_order
    load_order_item
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    load_order
    load_order_item
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def load_order
    @order = current_order
  end

  def load_order_item
    @order_item = @order.order_items.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:photo_id)
  end
end