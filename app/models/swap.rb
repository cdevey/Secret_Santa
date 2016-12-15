class Swap < ActiveRecord::Base

has_many :memberships
has_many :users, through: :memberships
has_many :recipients

validates :location, :when, :swap_description, presence: true



  def to_s
    "#{swap_description}"
  end

def is_owner?(user)
  memberships.where(user: user, owner: true).any?
end


end
