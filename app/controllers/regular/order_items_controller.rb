class Regular::OrderItemsController < RegularController
  def create
    load_order
    # @order_item = @order.order_items.new(order_item_params)
    @order_item = @order.order_items.build(order_item_params)
    @order.save
    save_order_to_session(@order)
    @order_item = @order.order_items.find_by(order_item_params)

    respond_to do |format|
      format.js
    end
  end

  # # TODO: think is update needed or not
  # def update
  #   load_order
  #   load_order_item
  #   @order_item.update_attributes(order_item_params)
  #   @order_items = @order.order_items
  # end

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