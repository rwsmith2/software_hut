class CompletedtasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_nav_identifier = :completedtasks_index

    @pagy, @tasks = pagy(Task.all, items: 10)
    @task = Task.new
    @assessments = Assessment.all.select("assessment_id, assessment_title")
    #User .build_attribute_name, as it is a has_one association
    @task.build_assessment_linker
    # fetch the completed tasks that are specifically assigned to the logged in vendor
    @selected= Task.first  
    @joined= Assignment.joins(:given_task).merge(GivenTask.joins(:task)).select(:task_title, :due_date, :set_date, :complete).where("complete=true")
    @tasks = @joined.order(params[:sort])
    render :index

  end
end
