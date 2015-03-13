class NotificationMailer < ActionMailer::Base
  include SendGrid
  default from: "no-replay@taxi.friendwith.me"

  def notify(order)
    @order = order
    mail(to: ENV['MAIL'], subject: "Тебе заказали такси!")
  end
end
