class NotificationMailer < ActionMailer::Base
  include SendGrid
  default from: "no-replay@taxi.friendwith.me"

  def notify(order)
    @order = order
    mail(to: ENV['SEND_MAIL'], subject: "У тебя заказали такси!")
  end
end
