module Admin
  class CarsController < AdminBaseController

    def index
      @cars = Car.all.includes(:brand).includes(:model)
    end

  end
end