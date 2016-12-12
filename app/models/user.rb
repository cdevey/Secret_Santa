class User < ActiveRecord::Base

  has_many :memberships
  has_many :swaps, through: :memberships

  def to_s
    "#{first_name} #{last_name}"
  end


validates :first_name, :last_name, :email, :password, :shipping_address, :bio, presence: true

validates :email, uniqueness: true

end
