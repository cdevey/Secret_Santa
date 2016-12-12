class Membership < ActiveRecord::Base
  belongs_to :swap
  belongs_to :user

  def to_s
    @user
  end
  
end
