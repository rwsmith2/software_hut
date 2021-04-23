class CompletedtasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @tasks = pagy(Task.all, items: 10)
    @task = Task.new
    @assessments = Assessment.all.select("assessment_id, assessment_title")
    #User .build_attribute_name, as it is a has_one association
    @task.build_assessment_linker
    @selected= Task.first  
    @joined= GivenTask.joins(:task).select(:task_title, :due_date, :set_date)
    @tasks = @joined.order(params[:sort])
    render :index

  end
end
