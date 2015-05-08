module Admin
  class AdminBaseController < ApplicationController

    layout 'admin/layouts/application'

    before_action :authenticate_user!
    before_action :set_layout_params

    authorize_resource class: false

    private

    def set_layout_params
      @total_cars = Car.count
    end

  end
end