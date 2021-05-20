# Controller used to handle account requests
class RequestController < ApplicationController
  skip_authorization_check

  # GET    /request(.:format)
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

    user = User.new(email: @email, password: SecureRandom.hex(8), user_name: @email, is_admin: false)
    vendor = Vendor.new(company_name: @name, company_number: "0", validated: false)
    address = Address.new(city_town: @city, country: @region, house_name: @address, postcode: @postcode)

    if user.valid?
      user.save
      vendor.user_id = user.user_id
      if vendor.valid?
        vendor.save
        address.vendor_id = vendor.vendor_id
        if address.valid?
          #Email the result to the vendor
          address.save
          RequestMailer.with(email: @email, name: @name).welcome_email.deliver_now
          render :success
          return
        else
          user.destroy
          vendor.destroy
          @error_obj = address
        end
      else
        user.destroy
        @error_obj = vendor
      end
    else
      @error_obj = user
    end
    @current_nav_identifier = :login
    render :index
  end

end
