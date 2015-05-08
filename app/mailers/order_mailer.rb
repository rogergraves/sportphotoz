class OrderMailer < ApplicationMailer
  def thanks_for_purchasing(email, order)
    @order = order
    mail(to: email, subject: 'Thank You for purchasing')
  end
end
