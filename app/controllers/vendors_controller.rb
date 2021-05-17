class VendorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vendor

    def index
      @current_nav_identifier = :vender_home
      
      @user = current_user
      @vendor = Vendor.find_by(user_id: @user.user_id)
      #query to get all tasks and assignments for the given vendor
      @joined = Assignment.joins(:given_task).select(:due_date, :set_date, :given_task_id, :task_id, :assignment_id)
      @pagy, @tasks = pagy(@joined.where(vendor_id: @vendor.vendor_id, complete: false).order(params[:sort]), items: 10)
      @tasksCount = Assignment.where(vendor_id: @vendor.vendor_id, complete: false).count 

      puts ("date: " + DateTime.now.to_s )
      @overdueTask = @tasks.where('due_date >= ?' , DateTime.now)
      

      render :index

    end

    def edit
      @current_nav_identifier = :edit_vendor
    end

    #/vendor/search
    def search
      puts "searching for vendor" 
      #Create a list of tasks matching the search query
      @vendorL = Vendor.find_by("company_name LIKE ?","%#{params[:search][:company_name]}%")
      puts @vendorL.company_name
      #render a view in the admin view folder
      render 'admin/vendor_search_refresh'
    end

    def destroy
      @vendor_destroy = Vendor.find(params[:id])
      @vendor_destroy.destroy
      redirect_to admin_management_path, notice: 'Vendor was successfully destroyed.'
      # @vendor = Vendor.find(v_params[:vendor_id])
      # puts "vendor" + @vendor.company_name
      # @vendor.destroy
      # flash.alert = 'Post was successfully destroyed.js.haml'
    end

    def delete_vendor
      @vendor = Vendor.find(del_params[:vendor_id])
      puts "vendor" + @vendor.company_name
      @vendor.destroy
      flash.alert = 'Vendor Destroyed'
    end

    def update
      if @vendor.update(vendor_params)
        redirect_to edit_vendor_path, notice: 'Vendor Settings were successfully updated.'
      else
        render :edit
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_vendor
        @user = current_user
        #puts(@user.user_id)
        # @vendor = Vendor.find_by(user_id: @user.user_id)
        # puts(@vendor.company_name)
      end

    # Only allow a trusted parameter "white list" through.
    def vendor_params
      params.require(:user).permit(:user_name, :email, :user_id)
      #Registration doesn't add stuff to vendor table yet, need to add this still
      #params.require(:vendor).permit(:company_name, :company_number,:vendor_id, user_attributes: [:user_name, :email, :user_id])
    end

    def v_params
      params.require(:vendor).permit(:company_name, :company_number,:vendor_id,:initial_score, :credit_rating, :kpi, :risk_rating, user_attributes: [:user_name, :email, :user_id])
    end

    def del_params
      params.require(:vendor)
    end
end