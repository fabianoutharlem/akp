module Admin
  class AdminController < ApplicationController

    before_action :authenticate_user!

    check_authorization :class => false

  end
end