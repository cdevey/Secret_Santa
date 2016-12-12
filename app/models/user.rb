class User < ActiveRecord::Base
#  def to_s
#    user
#  end


validates :first_name, :last_name, :email, :password, :shipping_address, :bio, presence: true

validates :email, uniqueness: true

end
