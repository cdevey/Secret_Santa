class User < ActiveRecord::Base
  def to_s
    # you need to call an attribute or attributes. Calling 'user' 
    "#{first_name} #{last_name}"
  end


validates :first_name, :last_name, :email, :password, :shipping_address, :bio, presence: true

validates :email, uniqueness: true

end
