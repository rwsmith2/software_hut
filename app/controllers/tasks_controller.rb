# Controller used to handle Tasks 
class TasksController < ApplicationController
  
  #Before actions
  before_action :authenticate_user!
  before_action :set_task, only: [:edit,:destroy, :update]

  authorize_resource

  # GET /admin/tasks
  def index
    #Get a list of all tasks and set the selected to the first task
    @pagy, @tasks = pagy(Task.all, items: 10)
    @selected= Task.first

    #Initialize new Task and build assessment_linker
    @task = Task.new
    @task.build_assessment_linker

    #List of assessments, so dropdown can populate with the values 
    @assessments = Assessment.all.select("assessment_id, assessment_title")

    render :index
  end

  #GET /tasks/search
  def search
    #Create a list of tasks matching the search query
    @pagy, @tasks = pagy(Task.where("task_title LIKE ?","%#{params[:search][:task_title]}%"), items: 10)
    render 'search_refresh'
  end


  # GET /tasks/new
  def new 
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @assessments = Assessment.all.select("assessment_id, assessment_title")
    #If the task doesn't have an assessment attached, build the assessment_linker
    if @task.assessment_linker == nil
      @task.build_assessment_linker
    end
    #Don't render layout, as its a modal
    render layout: false
  end

  #GET /fetch_task
  def select_task
    #Fetch the selected task, and format the javascript
    @selected = Task.find(params[:task_id])
    respond_to do |format|
      format.js
    end
  end


  # POST /tasks
  def create
    if(task_params[:assessment_linker_attributes][:assessment_id]=="")
      #No assessment attached, manually add task_params
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

  # PATCH /tasks/:id
  def update
    #If no assessment attached to params
    if(task_params[:assessment_linker_attributes][:assessment_id]=="")
      #If there is an assessment attached, destroy it
      if @task.assessment_linker != nil
        @task.assessment_linker.destroy
      end
      if(@task.update_attribute(:task_title, task_params[:task_title]) || 
          @task.update_attribute(:task_description, task_params[:task_description]) || 
          @task.update_attribute(:estimation, task_params[:estimation]))
          @pagy, @tasks = pagy(Task.all, items: 10)
        render 'update_success'
      else
        render 'update_failure'
      end
    else
      #If assessment is attached
      if @task.update(task_params)
        @pagy, @tasks = pagy(Task.all, items: 10)
        render 'update_success'
      else
        render 'update_failure'
      end
    end
  end

  #DELETE /tasks/:id
  def destroy
    #Fetch the selected task and destroy it
    @task_destroy = Task.find(params[:id])
    @task_destroy.destroy
    redirect_to admin_tasks_path, notice: 'Task was successfully destroyed.'
  end

  private
  # Set the task method
  def set_task
    @task = Task.find(params[:id])
  end

  #Only allow a trusted parameter "white list" through.
  def task_params
    #Fetch task attributes, along with nested assessment_linker attributes
    params.fetch(:task, {}).permit(:task_title, :task_description, :estimation, 
      assessment_linker_attributes: [:assessment_id, :id])
  end

end