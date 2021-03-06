module Admin
  class ActionPagesController < AdminBaseController

    before_action :set_action_page, only: [:show, :edit, :destroy, :update]

    def index
      @action_pages = ActionPage.all
    end

    def new
      @action_page = ActionPage.new
    end

    def create
      @action_page = ActionPage.create(action_page_params)
      if @action_page.valid?
        flash[:notice] = ['ActionPage has been created succesfully']
        render :edit
      else
        flash[:error] = @action_page.errors.full_messages
        render :new
      end
    end

    def edit

    end

    def update
      begin
        @action_page.update action_page_params
        if @action_page.valid?
          flash[:notice] = ['ActionPage has been updated succesfully']
          redirect_to admin_action_pages_path
        else
          flash[:error] = @action_page.errors.full_messages
          render :edit
        end
      rescue
        flash[:error] = ['Some fields were not correct, please correct them and try again.']
        render :edit
      end
    end

    def destroy
      if @action_page.destroy
        flash[:notice] = ['The page has been deleted.']
      else
        flash[:error] = ['The page was not deleted']
      end
      redirect_to admin_action_pages_path
    end

    private

    def set_action_page
      begin
        @action_page = ActionPage.find(params[:id])
      rescue
        flash[:error] = ['ActionPage could not be found.']
        redirect_to admin_action_pages_path
      end
    end

    def action_page_params
      params.require(:action_page).permit(:id, :banner_title, :slug, :banner_subtitle, :banner_image, :banner_image_cache, :brand_id, :model_id, :active, :header_title, :header_text, :car_section_title, :car_section_subtitle, :orange_banner_enabled, :orange_banner_image, :orange_banner_title, :orange_banner_text, :pros_list_enabled, :reference_banner_enabled, :reference_image, :reference_stars, :reference_text, :reference_car_image, :reference_header, :reference_subtitle, :pro_1, :pro_2, :pro_3, :pro_4, :pro_5, :pro_6, :pro_7)
    end

  end
end