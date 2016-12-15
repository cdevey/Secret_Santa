class Membership < ActiveRecord::Base
  belongs_to :swap
  belongs_to :user

  validates :swap, :user, presence: true

#  validates :user, uniqueness: {scope: :swap}


  def to_s
    @user
  end

end
