module Admin
  class BlogPagesController < AdminBaseController

    before_action :set_blog_page, only: [:show, :edit, :destroy, :update]

    def index
      @blog_pages = BlogPage.all
    end

    def new
      @blog_page = BlogPage.new
    end

    def create
      @blog_page = BlogPage.create(blog_page_params)
      if @blog_page.valid?
        flash[:notice] = ['BlogPage has been created succesfully']
        redirect_to admin_blog_pages_path
      else
        flash[:error] = ['Some fields were not filled in correctly, please check and try again.']
        render :edit
      end
    end

    def edit

    end

    def update
      begin
        @blog_page.slug = nil
        @blog_page.update_attributes blog_page_params
        flash[:notice] = ['BlogPage has been updated succesfully']
        redirect_to admin_blog_pages_path
      rescue
        flash[:error] = ['Some fields were not correct, please correct them and try again.']
        render :edit
      end

    end

    def destroy
      if @blog_page.destroy
        flash[:notice] = ['The BlogPage has been deleted.']
      else
        flash[:error] = ['The BlogPage was not deleted']
      end
      redirect_to admin_blog_pages_path
    end

    private

    def set_blog_page
      begin
        @blog_page = BlogPage.find(params[:id])
      rescue
        flash[:error] = ['BlogPage could not be found.']
        redirect_to admin_blog_pages_path
      end
    end

    def blog_page_params
      params.require(:blog_page).permit(
          :id,
          :title,
          :content,
          :templateable_type,
          :templateable_id,
          templateable_attributes: (
                BlogTemplateAutoAfbetaling.permitted_attributes +
                BlogTemplateAutoLeaseMogelijkheden.permitted_attributes +
                BlogTemplateFullOperationalLease.permitted_attributes +
                BlogTemplateLeaseGebruikteAutos.permitted_attributes +
                BlogTemplateOnzeWerkplaats.permitted_attributes +
                BlogTemplateVoordelenFinancialLease.permitted_attributes +
                BlogTemplateOpelEyeTracking.permitted_attributes +
                BlogTemplateAutoBlog.permitted_attributes).uniq
      )
    end

  end
end
