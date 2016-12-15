class Membership < ActiveRecord::Base
  belongs_to :swap
  belongs_to :user

  validates :swap_id, :user_id, presence: true



  def to_s
    @user
  end

end
