module CartHelper

  def photo_in_cart?(photo)
    current_order.order_items.exists?(photo: photo)
  end

end