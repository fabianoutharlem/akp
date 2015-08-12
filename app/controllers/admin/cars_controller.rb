module Admin
  class CarsController < AdminBaseController

    def index
      @cars = Car.all.car_includes
    end

  end
end