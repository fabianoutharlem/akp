module Admin
  class CmsFieldsController < AdminBaseController


    def index
      @cms_field = CmsField.find_or_create_by(id: 1)
    end

    def update
      CmsField.find(params[:id]).update(cms_field_params)
      redirect_to admin_cms_fields_path
    end

    private

    def cms_field_params
      params.require(:cms_field).permit(:home_foto_1, :home_foto_2, :home_foto_3, :service_bg)
    end

  end
end