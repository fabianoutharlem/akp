module Admin
  class FaqsController < AdminBaseController

    before_action :set_faq, only: [:show, :edit, :destroy, :update]

    def index
      @faqs = Faq.all
    end

    def new
      @faq = Faq.new
    end

    def create
      @faq = Faq.create(faq_params)
      if @faq.valid?
        flash[:notice] = ['Faq has been created succesfully']
        redirect_to admin_faqs_path
      else
        flash[:error] = ['Some fields were not filled in correctly, please check and try again.']
        render :edit
      end
    end

    def edit

    end

    def update
      begin
        @faq.update faq_params
        flash[:notice] = ['Faq has been updated succesfully']
        redirect_to admin_faqs_path
      rescue
        flash[:error] = ['Some fields were not correct, please correct them and try again.']
        render :edit
      end

    end

    def destroy
      if @faq.destroy
        flash[:notice] = ['The FAQ has been deleted.']
      else
        flash[:error] = ['The FAQ was not deleted']
      end
      redirect_to admin_faqs_path
    end

    private

    def set_faq
      begin
        @faq = Faq.find(params[:id])
      rescue
        flash[:error] = ['Faq could not be found.']
        redirect_to admin_faqs_path
      end
    end

    def faq_params
      params.require(:faq).permit(:id, :question, :answer)
    end

  end
end