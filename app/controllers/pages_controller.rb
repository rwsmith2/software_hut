class PagesController < ApplicationController

  skip_authorization_check

  def home
    # @current_nav_identifier = :home
    redirect_to "/users/sign_in"
  end

end
