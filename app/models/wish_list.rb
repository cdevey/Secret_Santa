class WishList < ActiveRecord::Base
  belongs_to :user
#  belongs_to :item

    has_many :items

  validates :user_id, :item_id, presence: true
  validates :user_id, uniqueness: true

  def to_s
    @user
  end

end
