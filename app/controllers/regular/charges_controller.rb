class Regular::ChargesController < RegularController
  def new
    load_order
  end

  def create
    load_order

    if @order.empty?
      redirect_to new_regular_charge_path and return
    end

    customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @order.subtotal_cents,  # Amount in cents
        :description => 'Some Photos',
        :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  else
    # If payment is OK and no errors raised
    close_order
    send_thanks_email
  end

  private

  def load_order
    @order = current_order
  end

  def close_order
    @order.paid!(params[:stripeEmail])
    session[:order_id] = nil
  end

  def send_thanks_email
    OrderMailer.thanks_for_purchasing(params[:stripeEmail], @order).deliver_now
  end
end