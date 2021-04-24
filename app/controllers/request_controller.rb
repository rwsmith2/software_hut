class RequestController < ApplicationController

    skip_authorization_check
  
    def index
      @current_nav_identifier = :login
    end

    # POST /request/create
    def create
      params_v = params.require(:create).permit(:email, :name, :address, :address, :city, :postcode, :region, :terms)

      @email = params_v[:email]
      @name = params_v[:name]
      @address = params_v[:address]
      @city = params_v[:city]
      @postcode = params_v[:postcode]
      @region = params_v[:region]

      user = User.new(email: @email, password: "default password", user_name: @email, is_admin: false)
      vendor = Vendor.new(user_id: user.user_id, company_name: @name, company_number: "0", validated: false)
      address = Address.new(vendor_id: vendor.vendor_id, city_town: @city, country: @region, house_name: @address, postcode: @postcode)

      if user.valid?
        if vendor.valid?
          if address.valid?
            user.save
            vendor.save
            address.save

            RequestMailer.with(email: @email, name: @name).welcome_email.deliver_now

            render :success
            return
          else
            @error_obj = address
          end
        else
          @error_obj = vendor
        end
      else
        @error_obj = user
      end

      @current_nav_identifier = :login
      render :index

      # user = User.create(email: email, password: "default password", user_name: email, is_admin: false)
      # vendor = Vendor.create(user_id: @user.user_id, company_name: @name, company_number: "0", validated: false)
      # address = Address.create(vendor_id: @vendor.vendor_id, city_town: @city, country: @region, house_name: @address, postcode: @postcode)
      
      # RequestMailer.with(email: @email, name: @name).welcome_email.deliver_now

      # render :success
    end

  end
