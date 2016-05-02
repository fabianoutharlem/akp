ActionMailer::Base.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :user_name => 'fabian@merqwaardig.com',
    :password  => 'SrmzEUjD5DB5acF5I-on6Q',
    :domain    => 'localhost'
}
ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = 'SrmzEUjD5DB5acF5I-on6Q'
end