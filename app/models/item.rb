class Item < ActiveRecord::Base

  validates :item_description, :link, presence: true
   

end
