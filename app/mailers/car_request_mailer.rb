class CarRequestMailer < ActionMailer::Base
  default from: "car_request@autokredietplan.nl"
  layout 'mailer'

  def send_mail(car_request)
    @car_request = car_request
    mail(to: 'fabjan.x@gmail.com', subject: 'Een finance request is ingedient')
  end

end
