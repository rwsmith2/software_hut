class TasksController < ApplicationController
    before_action :authenticate_user!
    
    authorize_resource

    # GET /tasks
    def index
      @tasks = Task.all
      @task = Task.new
      @assessments = Assessment.all.select("assessment_id, assessment_title")
      #User .build_attribute_name, as it is a has_one association
      @task.build_assessment_linker
      @first_task = Task.first
      render :index
    end

    def show
    end

    # GET /tasks/new
    def new 
      @task = Task.new
    end

    # GET /tasks/1/edit
    def edit
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
    end

    def destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    #Only allow a trusted parameter "white list" through.
    def task_params
      params.fetch(:task, {}).permit(:task_title, :task_description, :estimation, assessment_linker_attributes: [:assessment_id])
    end

    #This is used if no assessment is needed to be linked
    # def task_params_no_assessment
    #   params.fetch(:task, {}).permit(:task_title, :task_description, :estimation)
    # end
  
end