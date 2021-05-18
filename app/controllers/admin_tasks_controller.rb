class AdminTasksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @current_nav_identifier = :admin_tasks
  end

end
