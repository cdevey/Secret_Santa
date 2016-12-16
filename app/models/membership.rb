class Membership < ActiveRecord::Base
  belongs_to :swap
  belongs_to :user

  validates :swap, :user, presence: true

#  validates :user, uniqueness: {scope: :swap}


  def to_s
    @user
  end
  #here we attempted to create a scope called Owner that would show each swap & its owner so that users adding themselves to a swap would be
  #able to see who owned it
  #scope :owner, -> {:swap, :user}
end
