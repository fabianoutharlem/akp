module Admin
  class BrandsController < AdminBaseController
    def index
      @brands = Brand.all
    end

    def edit
      @brand = Brand.find(params[:id])
    end

    def update
      brand = Brand.find(params[:id])
      brand.update(brand_params)
      redirect_to admin_brands_path
    end

    private

    def brand_params
      params.require(:brand).permit(:description)
    end
  end
end