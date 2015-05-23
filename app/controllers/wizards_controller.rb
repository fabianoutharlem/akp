class WizardsController < ApplicationController

  layout false

  def pick_a_car
    comparison_price_field = params[:total_value_slider] == 'true' ? 'price_total' : 'price_month'
    default_range = params[:min] + '-' + params[:max]
    if params[:total_value_slider] == 'true'
      @total_range = default_range
    else
      @month_range = default_range
    end
    @cars = Car.where("#{comparison_price_field} >= :min_price AND #{comparison_price_field} <= :max_price", min_price: params[:min], max_price: params[:max])
  end

  def your_details
    @car = Car.find(params[:id])
  end

  def final
    CarRequest.create(car_request_params)
  end

  private

  def car_request_params
    params.permit(:type, :payment, :name, :amount, :phone, :license_plate, :email, :bkr, :net_income, :partner_net_income, :rent, :car_id)
  end

end