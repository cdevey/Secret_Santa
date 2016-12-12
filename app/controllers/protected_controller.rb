class ProtectedController < ApplicationController

  before_action :require_login
  before_action :current_user

  def require_login
    unless session[:user_id]
      flash[:message]="Please log in to view our site"
      redirect_to login_path
    end
  end

  def current_user
    @current_user=User.find(session[:user_id])

  end

  def require_ownership
    unless @current_user.organizer
      flash[:message]="You are not a swap organizer"
      redirect_to home_path
    end
  end

end
