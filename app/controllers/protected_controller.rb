class ProtectedController < ApplicationController

  before_action :require_login

  def require_login
    unless session[:user_id]
      flash[:message]="Please log in to view our site"
      redirect_to login_path
  end
end
