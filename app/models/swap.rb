class Swap < ActiveRecord::Base

has_many :memberships
has_many :users, through: :memberships
has_many :recipients

validates :location, :when, :swap_description, presence: true

#we wanted to create a scope that shows swaps with upcoming dates, which we would find by calling the when attribute on swap and comparing it to the current time
#scope :upcoming, -> {where(:swap.when= after today}

  def to_s
    "#{swap_description}"
  end

def is_owner?(user)
  memberships.where(user: user, owner: true).any?
end

end
