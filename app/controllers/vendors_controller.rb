class VendorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vendor

    def index
      @user = current_user
      @vendor = Vendor.find_by(user_id: @user.user_id)

      @joined = Assignment.joins(:given_task).select(:due_date, :set_date, :given_task_id, :task_id).where(complete: false)
      
      @tasks = @joined.where(vendor_id: @vendor.vendor_id).order(params[:sort])

      @assignmentsLeft = Assignment.where(vendor_id: @vendor.vendor_id, complete: false).count 

      render :index

    end

    def edit
    end

    def destroy
      @vendor = Vendor.find(v_params[:vendor_id])
      puts "vendor" + @vendor.company_name
      @vendor.destroy
      flash.alert = 'Post was successfully destroyed.'
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
end