class AdminsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_admin
    
    skip_authorization_check
  
    # def repeat_tasks
    #   today_date = Date.today
    #   @need_repeat_tasks = GivenTask.all
    #   @need_repeat_tasks.each do |given_task|
    #     if given_task.repeatable > 0 && today_date >= (given_task.set_date + given_task.repeatable)
    #       old_due_date = given_task.due_date
    #       task_time_length = (given_task.due_date - given_task.set_date).to_i
    #       given_task.set_date = today_date
    #       given_task.due_date = today_date + task_time_length
    #       given_task.save
    #       vendors_assigned = Assignment.where(given_task_id: given_task.given_task_id, complete_by: old_due_date).select(:vendor_id).distinct
    #       vendors_assigned.each do |new_assign|
    #         assignment = Assignment.new
    #         assignment.vendor_id = new_assign
    #         assignment.complete_by = given_task.due_date
    #         assignment.given_task_id = given_task.given_task_id
    #         assignment.save
    #       end
    #     end
    #   end
    # end

    def index
      @current_nav_identifier = :admin_home

      puts("Repeating tasks")
      today_date = Date.today
      @need_repeat_tasks = GivenTask.all
      @need_repeat_tasks.each do |given_task|
        puts(today_date, " ",(given_task.set_date + given_task.repeatable))
        puts(given_task.repeatable > 0 && today_date >= (given_task.set_date + given_task.repeatable))
        if given_task.repeatable > 0 && today_date >= (given_task.set_date + given_task.repeatable)
          puts(given_task.given_task_id, "is getting repeated")
          old_due_date = given_task.due_date
          task_time_length = (given_task.due_date - given_task.set_date).to_i
          given_task.set_date = today_date
          given_task.due_date = today_date + task_time_length
          given_task.save
          vendors_assigned = Assignment.where(given_task_id: given_task.given_task_id, complete_by: old_due_date).select(:vendor_id).distinct
          vendors_assigned.each do |new_assign|
            assignment = Assignment.new
            assignment.vendor_id = new_assign.vendor_id
            assignment.complete_by = given_task.due_date
            assignment.given_task_id = given_task.given_task_id
            assignment.save
            puts(assignment.vendor_id, "is getting assigned to repeated task")
          end
        end
      end

      @user = current_user
      
      @joined = Assignment.joins(:given_task).select(:assignment_id,:complete_by,:due_date, :set_date, :given_task_id, :task_id, :vendor_id, :priority)

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
      @current_nav_identifier = :admin_management
      
      @pagy, @vendor = pagy(Vendor.all.order(params[:sort]), items: 10)
      
    end


    def edit_vendor
      @vendorSelected = Vendor.find(params[:vendor_id])

      @user = User.find_by(user_id: @vendorSelected.user_id)
      render :admin_edit
    end

    def show_vendor_answer
      puts "In show vendor answer controller--"
      @assignment = Assignment.find(params[:assignment_id])
      render :vendor_answers
    end

    def download_file
      puts 'in the download controller'
      @vendor_answer = VendorAnswer.find_by(params[:answer_id])
      
      link_to "Download", @vendor_answer.image, download:@vendor_answer.image

    end

    def new_vendor
      @vendor = Vendor.new

    end

    def create_vendor
      #@vendor = Vendor.new(new_vendor_params)
      params_v = params.require(:vendor).permit(:email, :name, :address, :address, :city, :postcode, :region, :terms)

      @email = params_v[:email]
      @name = params_v[:name]
      @address = params_v[:address]
      @city = params_v[:city]
      @postcode = params_v[:postcode]
      @region = params_v[:region]

      user = User.new(email: @email, password: SecureRandom.hex(8), user_name: @email, is_admin: false)
      vendor = Vendor.new(company_name: @name, company_number: "0", validated: false)
      address = Address.new(city_town: @city, country: @region, house_name: @address, postcode: @postcode)

      if user.valid?
        user.save
        vendor.user_id = user.user_id
        if vendor.valid?
          vendor.save
          address.vendor_id = vendor.vendor_id
          if address.valid?
            address.save
            @vendorL = Vendor.all.order(params[:sort])
            render :management
            return
          else
            user.destroy
            vendor.destroy
            @error_obj = address
          end
        else
          user.destroy
          @error_obj = vendor
        end
      else
        @error_obj = user
      end

    end
 
    def create
      @task = Task.new(admin_id: current_user)
  
      if @task.update(post_params)
        redirect_to @task, notice: 'Task was successfully created.'
      else
        render :new
      end
    end

    #/admin/search_vendors
    def search_vendors
      puts "searching for vendor in admin controller" 
      #Create a list of tasks matching the search query
      @vendor = Vendor.where("company_name LIKE ?","%#{params[:search][:company_name]}%")
      #render a view in the admin view folder
      render 'vendor_search_refresh'
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

  #Only allow a trusted parameter "white list" through.
    def new_vendor_params
      #Fetch task attributes, along with nested assessment_linker attributes
      params.fetch(:vendor).permit(:email, :name, :address, :city, :postcode, :region, :term)
    end

    def assignment_params
      params.fetch(:assignment).permit(:assignment_id)
    end

  end
  