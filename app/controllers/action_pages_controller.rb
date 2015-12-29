class ActionPagesController < ApplicationController

  add_breadcrumb 'Acties'

  def show
    @action_page = ActionPage.find(params[:id])
    @cars = @action_page.cars.includes(:brand, :model).order(order_hash).page(params[:page]).per(8) if @action_page.present?
    add_breadcrumb @action_page.banner_title
  end

end