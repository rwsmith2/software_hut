class VendorsController < ApplicationController
    before_action :set_vendor

    def index

    end

    def edit
      @user = current_user
    end

    def update
      if @user.update(vendor_params)
        redirect_to edit_vendor_path, notice: 'Vendor Settings were successfully updated.'
      else
        render :edit
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_vendor
        @user = current_user
      end

    # Only allow a trusted parameter "white list" through.
    def vendor_params
      params.require(:user).permit(:user_name, :email, vendor_attributes: [:company_name, :company_number, :vendor_id])
    end
end