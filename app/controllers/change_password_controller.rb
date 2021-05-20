# Controller used to handle password changing 
class ChangePasswordController < ApplicationController
  before_action :authenticate_user!

  #GET    /change_password(.:format) 
  def index
    @current_nav_identifier = :change_password
  end

  #POST   /change_password/update(.:format)
  def update
    params_v = params.require(:update).permit(:newpass, :reppass)
    newpass = params_v[:newpass]
    reppass = params_v[:reppass]
    #Check to see if new password is different
    if newpass == reppass
      current_user.password = newpass
      if current_user.valid?
        current_user.save
        @info_msg = 'Password updated, please logout'
      else
        @error_msg = current_user.errors.full_messages[0]
      end
    else
      @error_msg = 'Inconsistent passwords'
    end
    render :index
  end
end
