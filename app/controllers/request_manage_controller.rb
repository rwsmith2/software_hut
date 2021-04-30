class RequestManageController < ApplicationController
    before_action :authenticate_user!

    skip_authorization_check
  
    def index
      @current_nav_identifier = :admin_requests

      @pending_vendors = Vendor.where(validated: false)
    end

    def select_request
      @vendor = Vendor.find(params[:vendor_id])

      respond_to do |format|
        format.js
      end
    end

    #method to accept vendor requests 
    def accept_request
      @vendor = Vendor.find(params[:vendor])
      @vendor.validated = true

      name = @vendor.company_name
      email = @vendor.user.email

      password = SecureRandom.hex(8)
      @vendor.user.password = password
      
      #check if vendor is saved to system
      if @vendor.save && @vendor.user.save
        RequestMailer.with(email: email, name: name, password: password).accepted_email.deliver_now

        redirect_to '/request_manage', notice: 'Request was successfully accepted'
      else
        redirect_to '/request_manage', notice: 'Error'
      end
    end

    #reject vendor request
    def reject_request
      @vendor = Vendor.find(params[:vendor])
      
      name = @vendor.company_name
      email = @vendor.user.email

      #destroy vendor after
      if @vendor.destroy
        RequestMailer.with(email: email, name: name).rejected_email.deliver_now

        redirect_to '/request_manage', notice: 'Request was successfully rejected'
      else
        redirect_to '/request_manage', notice: 'Error'
      end
    end
  
  end
