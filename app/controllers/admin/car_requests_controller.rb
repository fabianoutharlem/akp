module Admin
  class CarRequestsController < AdminBaseController

    def index
      car_requests = CarRequest.all.includes(:car).where.not(car: nil)
      car_requests_business = CarRequestBusiness.all.includes(:car).where.not(car: nil)
      @car_requests = (car_requests + car_requests_business).sort_by { |x| x.created_at}.reverse
      @car_requests = Kaminari.paginate_array(@car_requests).page(params[:page]).per(params[:per_page])
    end

    def show
      @car_request = CarRequest.find(params[:id])
    end

    def show_bussiness
      @car_request = CarRequestBusiness.find(params[:car_request_id])
    end

    def destroy
      if CarRequest.find(params[:id]).destroy
        flash[:notice] = ['Request has been deleted succesfully']
      else
        flash[:error] = ['Request could not be deleted']
      end
      redirect_to admin_car_requests_path
    end

    def destroy_bussiness
      if CarRequestBusiness.find(params[:car_request_id]).destroy
        flash[:notice] = ['Request has been deleted succesfully']
      else
        flash[:error] = ['Request could not be deleted']
      end
      redirect_to admin_car_requests_path
    end

  end
end