class NotificationMailer < ActionMailer::Base
  include SendGrid
  default from: "no-replay@taxi.friendwith.me"

  def notify(order)
    @order = order
    mail(to: ENV['MAIL'], subject: "У тебя заказали такси!")
  end
end
