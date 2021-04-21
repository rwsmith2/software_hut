class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit,:destroy, :update]

  
  authorize_resource

  # GET /tasks
  def index
    @pagy, @tasks = pagy(Task.all, items: 10)
    @task = Task.new
    @assessments = Assessment.all.select("assessment_id, assessment_title")
    #User .build_attribute_name, as it is a has_one association
    @task.build_assessment_linker
    @selected= Task.first


    render :index
  end

  def search
    @pagy, @tasks = pagy(Task.where("task_title LIKE ?","%#{params[:search][:task_title]}%"), items: 10)
    puts(@tasks.inspect)
    render 'search_refresh'
    # respond_to do |format|
    #   format.js
    # end
  end


  # GET /tasks/new
  def new 
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @assessments = Assessment.all.select("assessment_id, assessment_title")
    if @task.assessment_linker == nil
      @task.build_assessment_linker
    end
    render layout: false
  end

  def select_task
    @selected = Task.find(params[:task_id])
    respond_to do |format|
      format.js
    end
  end


  # POST /tasks
  def create
    if(task_params[:assessment_linker_attributes][:assessment_id]=="")
      #No assessment attached
      @task = Task.new()
      @task.task_title = task_params[:task_title]
      @task.task_description = task_params[:task_description]
      @task.estimation = task_params[:estimation]
    else
      #Assessment attached
      @task = Task.new(task_params)
    end

    if @task.save
      redirect_to admin_tasks_path, notice: 'Task was successfully created'
    else
      render :new
    end
  end


  def update
    if(task_params[:assessment_linker_attributes][:assessment_id]=="")
      puts("update no assessment")
      if @task.assessment_linker != nil
        puts("destroying link")
        @task.assessment_linker.destroy
      end
      if(@task.update_attribute(:task_title, task_params[:task_title]) || @task.update_attribute(:task_description, task_params[:task_description]) || @task.update_attribute(:estimation, task_params[:estimation]))
        @pagy, @tasks = pagy(Task.all, items: 10)
        render 'update_success'
      else
        render 'update_failure'
      end
    else
      puts("update with assessment")
      if @task.update(task_params)
        @pagy, @tasks = pagy(Task.all, items: 10)
        render 'update_success'
      else
        render 'update_failure'
      end
    end
  end

  def destroy
    @task_destroy = Task.find(params[:id])
    @task_destroy.destroy
    redirect_to admin_tasks_path, notice: 'Task was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  #Only allow a trusted parameter "white list" through.
  def task_params
    params.fetch(:task, {}).permit(:task_title, :task_description, :estimation, assessment_linker_attributes: [:assessment_id, :id])
  end

  def given_task_params
    params.fetch(:given_task, {}).permit(:task_id, :due_date, :priority, assignments_attributes: [:assignment_id,:vendor_id,:_destroy ])
  end

  #This is used if no assessment is needed to be linked
  # def task_params_no_assessment
  #   params.fetch(:task, {}).permit(:task_title, :task_description, :estimation)
  # end
  
end