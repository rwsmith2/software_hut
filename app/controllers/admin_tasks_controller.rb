class AdminTasksController < ApplicationController
  before_action :authenticate_user!
  
  skip_authorization_check

  def index
    @current_nav_identifier = :admin_tasks
  end

end
