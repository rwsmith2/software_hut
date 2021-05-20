# Controller used to handle admin controls 
class AdminsController < ApplicationController
  before_action :authenticate_user!

  #GET /admins(.:format)   
  def index
    @current_nav_identifier = :admin_home
    #Repeat the tasks which need repeating 
    Task.repeat_tasks()
    @user = current_user
    #Load the tasks for the admin dashboard
    @joined = Assignment.joins(:given_task).select(:assignment_id,:complete_by,:due_date, :set_date, :given_task_id, :task_id, :vendor_id, :priority).where("complete=false")
    @pagy, @tasks = pagy(@joined.order(params[:sort]), items: 10)
    render :index
  end

  #GET /admins/new(.:format)    
  def new
    @task = Task.new
  end

  # GET /admins/:id/edit(.:format)   
  def edit
    @user = current_user
  end

  #GET /admin/management(.:format)  
  def management
    @current_nav_identifier = :admin_management
    #used to display all vendors
    @pagy, @vendor = pagy(Vendor.all.order(params[:sort]), items: 6)
  end

  #GET /vendors/:id/edit(.:format) 
  def edit_vendor
    @vendorSelected = Vendor.find(params[:vendor_id])
    @user = User.find_by(user_id: @vendorSelected.user_id)
    render :admin_edit
  end

  #GET /admin/vendor_answers(.:format) 
  def show_vendor_answer
    session[:assignment_id] = params[:assignment_id]
    @assignment = Assignment.find(params[:assignment_id])
    render :vendor_answers
  end

  #GET /admin/completed_assignments(.:format)
  def completed
    @current_nav_identifier = :completed_tasks
    #Gets the list of assignments which are completed, but not verified yet
    @joined= Assignment.joins(:given_task).merge(GivenTask.joins(:task)).select(:assignment_id, :task_title, :due_date, :set_date, :complete, :priority, :vendor_id).where("complete=true AND verified= false")
    @pagy, @tasks = pagy(@joined.order(params[:sort]), items: 10)
    render :completed_assignments
  end

  #PATCH /admin/verify_assignment(.:format)
  def verify
    #Updates the selected assignments verified status
    @assignment = Assignment.find(session[:assignment_id])
    if @assignment.update(verify_params)
      render :vendor_answers
    else
      render :vendor_answers
    end
  end

  #GET /admin/new_vendor(.:format)
  def new_vendor
    @vendor = Vendor.new
  end

  
  #POST /admin/create_vendor(.:format) 
  def create_vendor
    params_v = params.require(:vendor).permit(:email, :name, :address, :address, :city, :postcode, :region, :terms)

    @email = params_v[:email]
    @name = params_v[:name]
    @address = params_v[:address]
    @city = params_v[:city]
    @postcode = params_v[:postcode]
    @region = params_v[:region]

    #Generate a secure password
    password = SecureRandom.hex(8)

    user = User.new(email: @email, password: password, user_name: @email, is_admin: false)
    vendor = Vendor.new(company_name: @name, company_number: "0", validated: true)
    address = Address.new(city_town: @city, country: @region, house_name: @address, postcode: @postcode)

    if user.valid?
      user.save
      vendor.user_id = user.user_id
      if vendor.valid?
        vendor.save
        address.vendor_id = vendor.vendor_id
        if address.valid?
          #Email the vendor that they are accepted
          address.save
          RequestMailer.with(email: @email, name: @name, password: password).accepted_email.deliver_now
          redirect_to :admin_management
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

    render :new_vendor
  end

  #POST /admins(.:format) 
  def create
    @task = Task.new(admin_id: current_user)
    if @task.update(post_params)
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  #POST /vendors/search(.:format)                                                                
  def search_vendors
    #Create a list of tasks matching the search query
    @vendor = Vendor.where("company_name LIKE ?","%#{params[:search][:company_name]}%")
    #render a view in the admin view folder
    render 'vendor_search_refresh'
  end

  #PUT /admins/:id(.:format)
  def update
    #Updates the selected vendors details
    @vendorSelected = Vendor.find(params[:id])
    if @vendorSelected.update_attributes(admin_params)
      redirect_to admin_management_path, notice: 'Admin settings where successfully updated.'
    else
      render :admin_admin_edit_path
    end
  end

  #DELETE /admins/:id(.:format)
  def destroy
    @task.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:vendor).permit(:company_name, :company_number,:vendor_id,:initial_score, :credit_rating, :kpi, :risk_rating)
    end

    #Params used to update an assignments verification status
    def verify_params
      params.fetch(:assignment).permit(:assignment_id, :verified)
    end

end
  