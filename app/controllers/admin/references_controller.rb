module Admin
  class ReferencesController < AdminBaseController
    def index
      @references = Reference.all
    end

    def approve
      reference = Reference.find(reference_params[:id])
      reference.update(reference_params)
      redirect_to admin_references_path
    end

    def destroy
      reference = Reference.find(params[:id])
      reference.destroy
      redirect_to admin_references_path
    end

    private

    def reference_params
      params.require(:reference).permit(:id, :approved)
    end
  end
end