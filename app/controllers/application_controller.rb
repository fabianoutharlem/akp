class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout

  add_breadcrumb 'Home', :root_path

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/users/sign_in', :alert => exception.message
  end

  def order_hash
    field = (params[:sort_field] || 'brands.name, models.name, car_type')
    direction = (params[:sort_direction] || :asc).to_sym
    "#{field} #{direction}"
  end

  protected

  def track_event(category, action, label = nil, value = nil)
    return unless defined?(GA_TRACKER) && GA_TRACKER.is_a?(Staccato::Tracker)
    GA_TRACKER.event(category: category, action: action, label: label, value: value)
  end

  private

  def layout
    false if is_a?(Devise::SessionsController)
  end

end
