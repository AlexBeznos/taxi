class Notification
  def self.taxi_was_called(order)
    send_vk_message(order)
    send_email_message(order)
  end

  private
  def send_vk_message(order)
    begin

      client = VkontakteApi::Client.new(ENV['VK_ACCESS_TOKEN'])
      message = "Долбоеб, зайди на сайт там у тебя такси заказали, ёпт.<br>Ехать надо от #{order.from_street} #{order.from_house} и до #{order.to_street} #{order.to_house}<br>Заебал со своей хуетой!"
      client.messages.send(domain: ENV['VK_DOMAIN'], message: message)

    rescue VkontakteApi::Error => e

      if e.error_code == 14
        client_captcha = DeathByCaptcha.new(ENV['CAPTCHA_USER'], ENV['CAPTCHA_PASS'], :http)
        captcha = client_captcha.decode(url: e.captcha_img)

        client.messages.send(domain: ENV['VK__DOMAIN'],
                             message: message,
                             captcha_sid: e.captcha_sid,
                             captcha_key: captcha.text)
      end
  end

  def send_email_message(order)
    NotificationMailer.notify(order).deliver
  end

  handle_asynchronously :send_message
  handle_asynchronously :send_vk_message
  handle_asynchronously :send_email_message
end
