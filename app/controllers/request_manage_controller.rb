class RequestManageController < ApplicationController
    # TODO: Uncomment authenticate check
    # before_action :authenticate_user!
    # before_action :set_admin

    skip_authorization_check
  
    def index
      @current_nav_identifier = :request_manage

      @pending_vendors = Vendor.where(validated: false)
    end

    def select_request
      @vendor = Vendor.find(params[:vendor_id])

      # TODO: Quick patch of ApplicationRecord relation error
      @user_patch = User.find(@vendor.user_id)

      respond_to do |format|
        format.js
      end
    end

    def accept_request
      @vendor = Vendor.find(params[:vendor])
      @vendor.validated = true
      
      if @vendor.save

        # TODO: Email notification

        redirect_to '/request_manage', notice: 'Request was successfully accepted'
      else
        redirect_to '/request_manage', notice: 'Error'
      end
    end

    def reject_request
      @vendor = Vendor.find(params[:vendor])
      @user = User.find(@vendor.user_id)

      # TODO: ERROR: column addresses.user_id does not exist

      if @user.destroy
        redirect_to '/request_manage', notice: 'Request was successfully rejected'
      else
        redirect_to '/request_manage', notice: 'Error'
      end
    end
  
  end