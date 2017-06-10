class Notifier < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def thank_you(email, order)
    @order = order
    mail(to: email, subject: "Your order number is #{order.id}")
  end
end
