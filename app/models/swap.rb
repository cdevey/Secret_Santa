class Swap < ActiveRecord::Base

has_many :memberships
has_many :users, through: :memberships

validates :location, :when, :swap_description, presence: true


  def to_s
    "#{swap_description}"
  end









end
