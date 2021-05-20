# Controller used to handle managing account requests
class RequestManageController < ApplicationController
    before_action :authenticate_user!

    #GET    /request_manage(.:format) 
    def index
      @current_nav_identifier = :request_manage
      @pending_vendors = Vendor.where(validated: false)
    end

    #GET    /fetch_request(.:format)
    def select_request
      @vendor = Vendor.find(params[:vendor_id])
      respond_to do |format|
        format.js
      end
    end

    #GET    /accept_request(.:format)
    def accept_request
      #method to accept vendor requests 
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

    #GET    /reject_request(.:format)
    def reject_request
      #reject vendor request
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
