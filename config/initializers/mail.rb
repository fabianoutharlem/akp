ActionMailer::Base.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :user_name => 'michael@merqwaardig.com',
    :password  => 'dEB7CqN5RGv4Di7w9113Qw',
    :domain    => 'localhost'
}
ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = 'dEB7CqN5RGv4Di7w9113Qw'
end