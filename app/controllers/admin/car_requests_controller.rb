module Admin
  class CarRequestsController < AdminBaseController

    def index
      @car_requests = CarRequest.all.select {|car_request| !car_request.car.blank?}
    end

    def show
      @car_request = CarRequest.find(params[:id])
    end

    def destroy
      if CarRequest.find(params[:id]).destroy
        flash[:notice] = ['Request has been deleted succesfully']
      else
        flash[:error] = ['Request could not be deleted']
      end
    end

  end
end