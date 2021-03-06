class WizardsController < ApplicationController

  layout false

  def pick_a_car
    comparison_price_field = params[:total_value_slider] == 'true' ? 'price_50_50' : 'price_month'
    default_range = params[:min] + '-' + params[:max]
    if params[:total_value_slider] == 'true'
      @total_range = default_range
    else
      @month_range = default_range
    end
    @cars = Car.includes(:brand, :model).where("#{comparison_price_field} >= :min_price AND #{comparison_price_field} <= :max_price", min_price: params[:min], max_price: params[:max])
    @cars = @cars.where(brand: {name: params[:brand]}) if params[:brand].present?
    @cars = @cars.where(model: {name: params[:model]}) if params[:model].present?
    @cars = @cars.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def your_details
    @car = Car.find(params[:id])
  end

  def final
    klass = params[:request_type] == 'financial' ? CarRequestBusiness : CarRequest
    request = klass.create((params[:request_type] == 'financial' ? send(:car_request_bussiness_params) : send(:car_request_params)))
    CarRequestMailer.send_mail(request, request.email).deliver
    CarRequestMailer.send_mail(request, 'info@autokredietplan.nl').deliver
    track_event 'cars', 'finance request ingedient', request.car.display_name, params[:request_type]
  end

  private

  def car_request_params
    params.permit(:request_type, :payment, :name, :amount, :phone, :license_plate, :email, :bkr, :net_income, :partner_net_income, :rent, :car_id, :newsletter_subscribe, :bkr, :woonachtig)
  end

  def car_request_bussiness_params
    params.permit(:request_type, :payment, :first_name, :last_name, :amount, :phone, :email, :kvk, :car_id, :notes, :newsletter_subscribe, :date_creation, :woonachtig)
  end

end