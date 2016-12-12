class WishList < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :user_id, :item_id, presence: true
  validates :user_id, uniqueness: true
  

end
