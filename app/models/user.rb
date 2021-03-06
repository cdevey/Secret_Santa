class User < ActiveRecord::Base

  has_many :memberships
  has_many :swaps, through: :memberships
  has_many :items

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    full_name
  end


validates :first_name, :last_name, :email, :password, :shipping_address, :bio, presence: true

validates :email, uniqueness: true

end
