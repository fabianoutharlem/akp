class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/users/sign_in', :alert => exception.message
  end

  private

  def layout
    false if is_a?(Devise::SessionsController)
  end

end
