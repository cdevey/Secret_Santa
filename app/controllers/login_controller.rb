class LoginController < ApplicationController
  def index
  end

  def authenticate
    @user = User.find_by email: params[:email], password: params[:password]

  # create flash messages and redirect based on login success
  if @user
    flash[:message] = "Welcome #{@user.first_name}, Merry Christmas!"

    # set user id as session param, accessible to entire app
    session[:user_id] = @user.id
    redirect_to home_path
  else
    flash[:message] = "You have not been logged in. User can't be found"
    redirect_to login_path
  end
  end

  def logout
    session[:user_id] = nil
    flash[:message] = "You have been logged out"
    redirect_to home_path
  end

  def new_user
    session[:user_id]= nil
    redirect_to new_user_path
  end
end
