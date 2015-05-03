class ImportController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def handle
    begin
      if params[:actie]
        self.send(params[:actie])
      end
    rescue Exception => e
      logger.debug e.message
      render text: 'Something went wrong while executing the import, please contact the system admin', status: 500
    end
  end

  private

  def add
    car = Car.find_by_vehicle_number_hexon params[:voertuignr_hexon]
    if !car
      attributes = Car.parse_cardesk_parameters params
      Car.create(attributes)
      render text: 'The car was created succesfully', status: 200
    else
      render text: 'A car with this hexon number already exists, please use the change option to update the car', status: 409
    end
  end

  def change
    attributes = Car.parse_cardesk_parameters params
    car = Car.find_by_vehicle_number_hexon params[:voertuignr_hexon]
    if car
      car.car_medias.destroy_all
      car.update(attributes)
      render text: 'The car was updated succesfully', status: 200
    else
      render text: 'The car you are trying to update does not exist', status: 404
    end

  end

  def delete
    car = Car.find_by_vehicle_number_hexon params[:voertuignr_hexon]
    if car
      car.destroy!
      render text: 'The car was deleted succesfully', status: 200
    else
      render text: 'The car you are trying to delete does not exist', status: 404
    end
  end

end