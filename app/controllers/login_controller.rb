class LoginController < ApplicationController

    skip_authorization_check
  
    def index
      @current_nav_identifier = :login
    end
  
  end
  