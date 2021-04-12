class VendorsController < ApplicationController
    before_action :set_vendor

    def index
      @user = current_user
 

      #@vendor = Vendor.find_by(user_id: @user.user_id)
    end

    def edit

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
end