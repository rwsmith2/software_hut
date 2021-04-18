class AdminsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_admin
    
    skip_authorization_check
  
    def index
      @current_nav_identifier = :index
      @user = current_user

      @vendorTask = GivenTask.all

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
      render :admin_edit
    end
 
    # def update
    #   if @user.update(product_params)
    #     redirect_to edit_admins_path, notice: 'Settings were successfully updated.'
    #   else
    #     render :edit
    #   end
    # end

    def create
      @task = Task.new(admin_id: current_user)
  
      if @task.update(post_params)
        redirect_to @task, notice: 'Task was successfully created.'
      else
        render :new
      end
    end

    def update
      if @user.update(admin_params)
        redirect_to edit_admin_path, notice: 'Admin settings where successfully updated.'
      else
        render :edit
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
      params.require(:user).permit(:user_name, :email)
    end
  end
  