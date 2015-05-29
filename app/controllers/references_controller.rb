class ReferencesController < ApplicationController

  def index
    @references = Reference.where(approved: true)
    @avarage = Reference.avarage(@references)
  end

  def create
    Reference.create(reference_params)
    redirect_to references_path
  end

  private

  def reference_params
    params.require(:reference).permit(:name, :content, :email, :rating)
  end

end