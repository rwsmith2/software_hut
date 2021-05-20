# Controller used to handle vendors 
class VendorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vendor

    #/vendor/index
    def index
      @current_nav_identifier = :vender_home
      @user = current_user
      @vendor = Vendor.find_by(user_id: @user.user_id)
      #query to get all tasks and assignments for the given vendor
      @joined = Assignment.joins(:given_task).select(:priority,  :due_date, :set_date, :given_task_id, :task_id, :assignment_id, :complete_by)
      @pagy, @tasks = pagy(@joined.where(vendor_id: @vendor.vendor_id, complete: false).order(params[:sort]), items: 10)
      @tasksCount = Assignment.where(vendor_id: @vendor.vendor_id, complete: false).count 
      @overdueTask = @tasks.where('due_date >= ?' , DateTime.now)
      render :index
    end

    #/vendor/search
    def search
      #Create a list of tasks matching the search query
      @vendorL = Vendor.find_by("company_name LIKE ?","%#{params[:search][:company_name]}%")
      #render a view in the admin view folder
      render 'admin/vendor_search_refresh'
    end

    #destroy vendor (used from admin)
    def destroy
      @vendor_destroy = Vendor.find(params[:id])
      @vendor_destroy.destroy
      flash.alert = 'Vendor was successfully destroyed'
      redirect_to admin_management_path 
    end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_vendor
        @user = current_user
      end

end