module Admin
  class AdminController < ApplicationController

    layout 'admin/layouts/application'

    before_action :authenticate_user!

    authorize_resource class: false

    def home

    end

  end
end