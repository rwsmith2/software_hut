class AdminTasksController < ApplicationController

  skip_authorization_check

  def index
    @current_nav_identifier = :admin_task
  end

end
