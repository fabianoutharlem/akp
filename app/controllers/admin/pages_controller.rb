module Admin
  class PagesController < AdminBaseController

    before_action :set_page, only: [:show, :edit, :destroy, :update]

    def index
      @pages = Page.all
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.create(page_params)
      if @page.valid?
        flash[:notice] = ['Page has been created succesfully']
        redirect_to admin_pages_path
      else
        flash[:error] = ['Some fields were not filled in correctly, please check and try again.']
        render :edit
      end
    end

    def edit

    end

    def update
      begin
        @page.update page_params
        flash[:notice] = ['Page has been updated succesfully']
        redirect_to admin_pages_path
      rescue
        flash[:error] = ['Some fields were not correct, please correct them and try again.']
        render :edit
      end

    end

    def destroy
      if @page.destroy
        flash[:notice] = ['The Page has been deleted.']
      else
        flash[:error] = ['The Page was not deleted']
      end
      redirect_to admin_pages_path
    end

    private

    def set_page
      begin
        @page = Page.find(params[:id])
      rescue
        flash[:error] = ['Page could not be found.']
        redirect_to admin_pages_path
      end
    end

    def page_params
      params.require(:page).permit(:id, :title, :content)
    end

  end
end
