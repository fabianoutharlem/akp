module Admin
  class ReferencesController < AdminBaseController
    def index
      @references = Reference.all
    end

    def destroy
      reference = Reference.find(params[:id])
      reference.destroy
      redirect_to admin_references_path
    end

    def approve
      reference = Reference.find(params[:id])
      reference.update(approved: true)
      redirect_to admin_references_path
    end

    def disapprove
      reference = Reference.find(params[:id])
      reference.update(approved: false)
      redirect_to admin_references_path
    end

  end
end