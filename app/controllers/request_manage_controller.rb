class RequestManageController < ApplicationController
    # before_action :authenticate_user!
    # before_action :set_admin

    skip_authorization_check
  
    def index
      @current_nav_identifier = :request_manage
    end
  
  end