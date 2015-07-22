class CarRequestMailer < ActionMailer::Base
  layout 'mailer'

  def send_mail(car_request, email)
    @car_request = car_request
    mail(to: email, from: 'car_request@autokredietplan.nl', subject: 'Een finance request is ingediend')
  end

end
