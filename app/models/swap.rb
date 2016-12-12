class Swap < ActiveRecord::Base

has_many :memberships
has_many :users, through: :memberships

  def to_s
    "#{swap_description}"
  end

  validates :location, :when, :swap_description, presence: true
  


end
