class GivenTasksController < ApplicationController
  require 'date'
  authorize_resource


  def index
    @given_tasks = GivenTask.all
    @selected = GivenTask.first
  end

  def select_given_task
    @selected = GivenTask.find(params[:given_task_id])
    puts(@selected.inspect)
    respond_to do |format|
      format.js
    end
  end

  # GET /tasks/new
  def new 
    session[:task_id] = params[:task_id]
    #@task_id = params[:task_id]
    @given_task =  GivenTask.new
    @given_task.assignments.build
    @vendors = Vendor.all
    
    render layout: false
  end

  


  # POST /tasks
  def create
    @given_task = GivenTask.new(given_task_params)
    #@given_task.assignments.build
    puts(@given_task)
    @given_task.task_id = session[:task_id]
    @given_task.priority = 2
    @given_task.set_date = Date.today
    @given_task.due_date  = Date.strptime(given_task_params[:due_date],  "%d-%m-%Y")
    #@given_task.priority = given_task_params[:priority]
    @given_task.repeatable = given_task_params[:repeatable].to_i
    puts(@given_task.inspect)
    if @given_task.save
      redirect_to admin_assessments_path, notice: 'Task was successfully assigned'
    else
      render :new
    end
  end


  def destroy
    
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_task
  #   @task = Task.find(params[:id])
  # end

  def given_task_params
    params.fetch(:given_task, {}).permit(:due_date, :priority, :repeatable, :task_id, assignments_attributes: [:assignment_id,:vendor_id ,:_destroy])
  end

  #This is used if no assessment is needed to be linked
  # def task_params_no_assessment
  #   params.fetch(:task, {}).permit(:task_title, :task_description, :estimation)
  # end
  
end