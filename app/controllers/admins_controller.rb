class AdminsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_admin
    
    skip_authorization_check
  
    def index
      @current_nav_identifier = :index
      @user = current_user
      
      @joined = Assignment.joins(:given_task).select(:due_date, :set_date, :given_task_id, :task_id, :vendor_id, :priority)
      @pagy, @tasks = pagy(@joined.order(params[:sort]), items: 10)

      render :index
    end

    def new
      @task = Task.new
    end

    # GET /products/1/edit
    def edit
      @user = current_user
    end

    def management
      @vendorL = Vendor.all.order(params[:sort])
      
    end

    def edit_vendor
      @vendorSelected = Vendor.find(params[:vendor_id])

      @user = User.find_by(user_id: @vendorSelected.user_id)
      render :admin_edit
    end
 
    def create
      @task = Task.new(admin_id: current_user)
  
      if @task.update(post_params)
        redirect_to @task, notice: 'Task was successfully created.'
      else
        render :new
      end
    end

    def update
      @vendorSelected = Vendor.find(params[:id])
      if @vendorSelected.update_attributes(admin_params)
        redirect_to admin_management_path, notice: 'Admin settings where successfully updated.'
      else
        render :admin_admin_edit_path
      end
    end
  
    def destroy
      @task.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    def search
    end
  
    def search_result
      #@posts = Post.where("title = ?", params[:search][:title]).where("private_post = 'f'")
      #@posts = Post.where("title = '#{params[:search][:title]}'").where("private_post = 'f'")
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.
      def set_admin
        @user = current_user
      end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:vendor).permit(:company_name, :company_number,:vendor_id,:initial_score, :credit_rating, :kpi, :risk_rating)
    end
    
  end
  