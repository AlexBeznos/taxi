ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 25,
  :domain => "taxi.friendwith.me",
  :authentication => :plain,
  :user_name => ENV['SENDGRID_USER'],
  :password => ENV['SENDGRID_PASSWORD']
}
