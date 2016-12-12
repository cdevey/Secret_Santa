class HomeController < ApplicationController
  def index
    @user = User.find(session[:user_id])
#    @memberships = Memberships.find(:user_id==@user)
  end
end
