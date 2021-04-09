class RequestController < ApplicationController

    skip_authorization_check
  
    def index
      @current_nav_identifier = :request
    end
  
  end
  