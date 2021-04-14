class RequestController < ApplicationController

    skip_authorization_check
  
    def index
      @current_nav_identifier = :login
    end

    # POST /request/create
    def create
      email = params[:create][:email]
      name = params[:create][:name]
      address = params[:create][:address]
      city = params[:create][:city]
      postcode = params[:create][:postcode]
      region = params[:create][:region]

      user = User.create(email: email, password: "default password", user_name: email, is_admin: false)
      vendor = Vendor.create(user_id: user.user_id, company_name: name, company_number: "0", validated: false)
      address = Address.create(vendor_id: vendor.vendor_id, city_town: city, country: region, house_name: address, postcode: postcode)
      
      render :success
    end
  
  end
