class GivenTasksController < ApplicationController

  authorize_resource






  # GET /tasks/new
  def new 
    @given_task =  GivenTask.new
    @given_task.assignments.build
    @vendors = Vendor.all
    puts(@vendors.inspect)
    
    render layout: false
  end

  


  # POST /tasks
  def create
    @given_task = GivenTask.new(given_task_params)
    # @assessment.assessment_title = task_params[:assessment_title]
    # @assessment.task_description = task_params[:task_description]
    # @assessment.estimation = task_params[:estimation]

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
    params.fetch(:given_task, {}).permit(:due_date, :priority, :repeatable, :task_id, assignments_attributes: [:assignment_id,:vendor_id, :company_name ,:_destroy])
  end

  #This is used if no assessment is needed to be linked
  # def task_params_no_assessment
  #   params.fetch(:task, {}).permit(:task_title, :task_description, :estimation)
  # end
  
end