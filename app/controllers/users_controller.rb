# Controller used to handle users 
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  authorize_resource
  
  #GET    /users/:id/edit(.:format)
  def edit 
    @current_nav_identifier = :users
  end

  #PUT    /users/:id(.:format)s
  def update
    if @user.update(user_params)
      redirect_to :root, notice: 'Your details were successfully updated'
    else
      render :edit
    end
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email)
    end

end