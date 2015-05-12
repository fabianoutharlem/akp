class CarsController < ApplicationController

  def home
    @cars = Car.all.limit(10).order(created_at: :asc)
  end

  def index

  end

end