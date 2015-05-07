class Regular::ChargesController < RegularController
  def new
    load_order
  end

  def create
    load_order

    customer = Stripe::Customer.create(
        :email => 'example@stripe.com',
        :card  => params[:stripeToken]
    )

    begin
      Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @order.subtotal_cents,  # Amount in cents
          :description => 'Some Photos',
          :currency    => 'usd'
      )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    else
      # If payment ok and no errors raised
      close_order
    end

    # charge = Stripe::Charge.create(
    #     :customer    => customer.id,
    #     :amount      => @order.subtotal_cents,  # Amount in cents
    #     :description => 'Some Photos',
    #     :currency    => 'usd'
    # )

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to charges_path
  end

  private

  def load_order
    @order = current_order
  end

  def close_order
    @order.paid!
    session[:order_id] = nil
  end
end