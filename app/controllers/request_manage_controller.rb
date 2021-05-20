class RequestManageController < ApplicationController
    before_action :authenticate_user!

    # GET /request_manage
    def index
      @current_nav_identifier = :request_manage
      @pending_vendors = Vendor.where(validated: false)
    end

    # GET /fetch_request
    def select_request
      @vendor = Vendor.find(params[:vendor_id])
      respond_to do |format|
        format.js
      end
    end

    # method to accept vendor requests 
    # GET /accept_request
    def accept_request
      # update recored
      @vendor = Vendor.find(params[:vendor])
      @vendor.validated = true

      name = @vendor.company_name
      email = @vendor.user.email

      password = SecureRandom.hex(8)
      @vendor.user.password = password
      
      # check if vendor is saved to system
      if @vendor.save && @vendor.user.save
        RequestMailer.with(email: email, name: name, password: password).accepted_email.deliver_now
        redirect_to '/request_manage', notice: 'Request was successfully accepted'
      else
        redirect_to '/request_manage', notice: 'Error'
      end
    end

    # reject vendor request
    # GET /reject_request
    def reject_request
      @vendor = Vendor.find(params[:vendor])
      name = @vendor.company_name
      email = @vendor.user.email
      # destroy vendor after
      if @vendor.destroy
        RequestMailer.with(email: email, name: name).rejected_email.deliver_now
        redirect_to '/request_manage', notice: 'Request was successfully rejected'
      else
        redirect_to '/request_manage', notice: 'Error'
      end
    end
  
  end
