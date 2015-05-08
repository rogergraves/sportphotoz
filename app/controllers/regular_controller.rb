class RegularController < ApplicationController

  helper_method :current_order

  def current_order
    return Order.new unless session[:order_id]

    order = Order.find_or_initialize_by(slug: session[:order_id])

    if order.paid?
      clean_order_session
      order = current_order
    end

    order
  end

  def save_order_to_session(order)
    session[:order_id] = order.slug
  end

  def clean_order_session
    session[:order_id] = nil
  end
end