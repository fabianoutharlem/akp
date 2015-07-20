require 'active_support/core_ext/hash/conversions'
class ImportController < ApplicationController

  skip_before_filter :verify_authenticity_token

  respond_to :xml

  def handle
    begin
    xml = Nokogiri::XML request.body
    @data = Hash.from_xml(xml.to_s)["voertuig"].symbolize_keys
      if @data[:actie]
        self.send(@data[:actie])
      end
    rescue Exception => e
      logger.debug e.message
      render text: 'Something went wrong while executing the import, please contact the system admin', status: 500
    end
  end

  private

  def add
    car = Car.find_by_vehicle_number_hexon @data[:voertuignr_hexon]
    if !car
      attributes = Car.parse_cardesk_parameters @data
      Raise 'Car was not created' unless Car.create!(attributes)
      render text: '1', status: 200
    else
      render text: 'A car with this hexon number already exists, please use the change option to update the car', status: 409
    end
  end

  def change
    attributes = Car.parse_cardesk_parameters @data
    car = Car.find_by_vehicle_number_hexon @data[:voertuignr_hexon]
    if car
      car.car_medias.destroy_all
      car.update(attributes)
      render text: '1', status: 200
    else
      render text: 'The car you are trying to update does not exist', status: 404
    end

  end

  def delete
    car = Car.find_by_vehicle_number_hexon @data[:voertuignr_hexon]
    if car
      car.destroy!
      render text: '1', status: 200
    else
      render text: 'The car you are trying to delete does not exist', status: 404
    end
  end

end