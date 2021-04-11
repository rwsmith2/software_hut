class TasksController < ApplicationController

    authorize_resource

    # GET /tasks
    def index
      @tasks = Task.all
      @task = Task.new(task_params)
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

    # POST /tasks
    def create
      @task = Task.new()
      @task.user_id = current_user.user_id
      @task.task_title = task_params[:task_title]
      @task.task_description = task_params[:task_description]
      @task.estimation = task_params[:estimation]

      if @task.save
        redirect_to admin_home_path, notice: 'Task was successfully created'
        
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

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.fetch(:task, {}).permit(:task_title, :task_description, :estimation)
    end
  
end