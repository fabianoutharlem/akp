class BrandsController < ApplicationController

  def models
    brand = Brand.find(params[:id])
    @models = brand.models
    respond_to :js
  end


end