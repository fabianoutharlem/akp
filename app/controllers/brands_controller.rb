class BrandsController < ApplicationController

  def models
    brand = Brand.find_by_name(params[:brand])
    @models = brand.models
    render json: @models.to_json
  end


end