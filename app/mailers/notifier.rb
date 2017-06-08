class Notifier < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def thank_you(recipient, order)
    @account = recipient
    @order = order
    mail(to: recipient.email, subject: "Your order number is #{order.id}")
  end
end
